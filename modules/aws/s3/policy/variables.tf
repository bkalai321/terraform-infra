variable "bucket_name" {
  type        = string
  description = "S3 Bucket Name"
}

variable "bucket_policy" {
  type        = string
  description = "s3 bucket policy from file syntax"
}

variable "bucket_region" {
  type        = string
  description = "bucket region"
  default     = "us-east-1"
}

