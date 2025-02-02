variable "networking" {
  type = object({
    cidr_block      = string
    region          = string
    profile         = string
    vpc_name        = string
    fiap_role       = string
    azs             = list(string)
    public_subnets  = list(string)
    private_subnets = list(string)
    nat_gateways    = bool
  })
  default = {
    cidr_block      = "10.0.0.0/16"
    region          = "us-east-1"
    profile         = "fiap-local"
    vpc_name        = "fiap-vpc"
    fiap_role       = "arn:aws:iam::619104548756:role/LabRole"
    azs             = ["us-east-1a", "us-east-1b"]
    public_subnets  = ["10.0.64.0/24", "10.0.96.0/24"]
    private_subnets = ["10.0.0.0/24", "10.0.32.0/24"]
    nat_gateways    = true
  }
}

variable "security_groups" {
  type = list(object({
    name        = string
    description = string
    ingress = list(object({
      description      = string
      protocol         = string
      from_port        = number
      to_port          = number
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
    }))
    egress = list(object({
      description      = string
      protocol         = string
      from_port        = number
      to_port          = number
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
    }))
  }))
  default = [{
    name        = "fiap-vpc-security-group"
    description = "Inbound & Outbound traffic for custom-security-group"
    ingress = [
      {
        description      = "Allow HTTPS"
        protocol         = "tcp"
        from_port        = 443
        to_port          = 443
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
      },
      {
        description      = "Allow HTTP"
        protocol         = "tcp"
        from_port        = 80
        to_port          = 80
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
      },
    ]
    egress = [
      {
        description      = "Allow all outbound traffic"
        protocol         = "-1"
        from_port        = 0
        to_port          = 0
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    ]
  }]
}

variable "rds_config" {
    type = object({
      name              = string
      instance_class    = string
      allocated_storage = number
      port              = number
      username          = string
      engine            = string
      engine_version    = string
    })
    default = {
      name              = "hack-database"
      instance_class    = "db.t3.micro"
      allocated_storage = 5
      port              = 5432
      username          = "hack_db_user"
      engine            = "postgres"
      engine_version    = "14.13"
    }
}

variable "cluster_config" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "hack-cluster"
    version = "1.30"
  }
}

variable "node_groups" {
  type = list(object({
    name           = string
    instance_types = list(string)
    ami_type       = string
    capacity_type  = string
    disk_size      = number
    scaling_config = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
    update_config = object({
      max_unavailable = number
    })
  }))
  default = [
    {
      name           = "t3-micro-standard"
      instance_types = ["t3.medium"]
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      scaling_config = {
        desired_size = 1
        max_size     = 2
        min_size     = 1
      }
      update_config = {
        max_unavailable = 1
      }
    },
  ]

}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  default = [
    {
      name    = "kube-proxy"
      version = "v1.30.0-eksbuild.3"
    },
    {
      name    = "vpc-cni"
      version = "v1.18.1-eksbuild.3"
    },
    {
      name    = "coredns"
      version = "v1.11.1-eksbuild.8"
    }
  ]
}