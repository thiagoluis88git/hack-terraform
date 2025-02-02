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

variable "hack_aws_access_key_id" {
  description = "Load Balancer DNS"
  type        = string
  sensitive   = true
}

variable "hack_aws_secret_access_key" {
  description = "Load Balancer DNS"
  type        = string
  sensitive   = true
}

variable "load_balancer_arn_uploader" {
  description = "Uploader Load Balancer ARN"
  type        = string
  sensitive   = false
}

variable "load_balancer_dns_uploader" {
  description = "Uploader Load Balancer DNS"
  type        = string
  sensitive   = false
}
