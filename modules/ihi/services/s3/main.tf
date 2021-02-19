provider "aws" {
  region = "${var.aws_region}"
}

module "s3_bucket_us_west_2" {
  source = "../../../aws/s3"
  bucket_name = "ihi-main-terraform"
  s3_versioning_enabled = "true"
  bucket_region = "us-west-2"
  aws_region = "${var.aws_region}"
}

module "s3_bucket_us_east_2" {
  source = "../../../aws/s3"
  bucket_name = "ihi-main-terraform"
  s3_versioning_enabled = "true"
  bucket_region = "us-east-2"
  aws_region = "${var.aws_region}"
}

module "s3_bucket_us_east_1" {
  source = "../../../aws/s3"
  bucket_name = "ihi-main-terraform"
  s3_versioning_enabled = "true"
  bucket_region = "us-east-1"
  aws_region = "${var.aws_region}"
}


# module "s3_bucket_policy_us_west_2" {
#   source = "../../../aws/s3/policy"
#   bucket_name = "${module.s3_bucket_us_west_2.bucket_name}"
#   bucket_policy = "${file("files/ihi-main-terraform-us-west-2.json")}"
#   bucket_region = "us-west-2"
# }

# module "s3_bucket_policy_us_east_1" {
#   source = "../../../aws/s3/policy"
#   bucket_name = "${module.s3_bucket_us_east_1.bucket_name}"
#   bucket_policy = "${file("files/ihi-main-terraform-us-east-1.json")}"
#   bucket_region = "us-east-1"
# }