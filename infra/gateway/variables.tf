variable "fastfood_aws_access_key_id" {
  description = "Load Balancer DNS"
  type        = string
  sensitive   = true
}

variable "fastfood_aws_secret_access_key" {
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
