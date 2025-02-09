resource "aws_sqs_queue" "video-processing-input-queue" {
  name                      = "video-processing-input-queue"
  delay_seconds             = 4
  max_message_size          = 40000
  message_retention_seconds = 864000
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
    Name = "video-processing-input-queue"
  }
}   

resource "aws_sqs_queue" "video-processed-output-queue" {
  name                      = "video-processed-output-queue"
  delay_seconds             = 4
  max_message_size          = 40000
  message_retention_seconds = 864000
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
    Name = "video-processed-output-queue"
  }
}  

resource "aws_sqs_queue" "video-processed-error-queue" {
  name                      = "video-processed-error-queue"
  delay_seconds             = 4
  max_message_size          = 40000
  message_retention_seconds = 864000
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
    Name = "video-processed-error-queue"
  }
}  