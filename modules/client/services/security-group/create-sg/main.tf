provider "aws" {
  region     = "${var.aws_region}"
}

module "create_security_group" {
  source = "../../../../aws/ec2/securitygroup"
  name = "${var.name}"
  component = "${var.component}"
  vpc_id = "${var.vpc_id}"
  create_by = "${var.jenkinsUser}"
}
