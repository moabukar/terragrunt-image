variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
