terraform {
  backend "s3" {
    bucket = "ratl-hack-2025-terraform-state2"
    key    = "fiap/hackathon-core"
    region = "us-east-1"
  }
}