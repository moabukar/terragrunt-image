resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  # acl    = "private"

  tags = {
    Name        = "example-bucket"
    Environment = var.environment
  }
}
