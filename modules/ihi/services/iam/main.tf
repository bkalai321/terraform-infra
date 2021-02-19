provider "aws" {
  region = "${var.aws_region}"
}

module "s3_access" {
  source = "../"
}