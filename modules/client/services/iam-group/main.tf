provider "aws" {
  region = "${var.aws_region}"
}

locals {
  bucket_name = "${format("%s-%s", var.bucket_name, var.bucket_region)}"
}
data "template_file" "s3_bucket" {
  template = "${file(var.policy_filename)}"
  
  vars {
    S3-BUCKET = "${local.bucket_name}"
  }
}

module "iam_group" {
  source = "../../../aws/iam/user/group"
  policy = "${data.template_file.s3_bucket.rendered}"
  name   = "${var.name}"
  component = "${var.component}"
}