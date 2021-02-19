provider "aws" {
  region = "${var.aws_region}"
}

module "s3_bucket" {
  source = "../../../aws/s3"
  bucket_name = "${var.bucket_name}"
  s3_versioning_enabled = "true"
  bucket_region = "${var.bucket_region}"
}