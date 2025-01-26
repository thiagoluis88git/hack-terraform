resource "aws_s3_bucket" "hack-video-processing-bucket" {
  bucket = "hack-video-processing-bucket"
  force_destroy = true

  tags = {
    Name        = "hack-video-processing-bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket" "hack-processed-zip-bucket" {
  bucket = "hack-processed-zip-bucket"
  force_destroy = true

  tags = {
    Name        = "hack-processed-zip-bucket"
    Environment = "Production"
  }
}