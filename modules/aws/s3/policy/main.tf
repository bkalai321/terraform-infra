provider "aws" {
  alias  = "s3_bucket"
  region = var.bucket_region
}

resource "aws_s3_bucket_policy" "main" {
  provider = aws.s3_bucket
  bucket   = var.bucket_name
  policy   = var.bucket_policy
}

