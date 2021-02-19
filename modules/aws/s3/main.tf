provider "aws" {
  alias  = "s3_bucket"
  region = var.bucket_region
}

resource "aws_s3_bucket" "main" {
  provider = aws.s3_bucket
  bucket   = "${var.bucket_name}-${var.bucket_region}"
  acl      = var.bucket_acl

  versioning {
    enabled = var.s3_versioning_enabled
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.server_side_encryption_algorithm
        kms_master_key_id = var.kms_key_id
      }
    }
  }
}

