terraform {
  backend "s3" {
    bucket = "ratl-hack-2025-terraform-state"
    key    = "fiap/hackathon-gateway"
    region = "us-east-1"
  }
}