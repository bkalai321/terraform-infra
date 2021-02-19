provider "aws" {
  region     = "${var.aws_region}"
}

module "add_rules_to_sg" {
  source = "../../../../aws/ec2/securitygroup/security-rule/security-group"

  main_rules = [
    "ingress", "${var.source_port}", "${var.destination_port}" , "${var.sg_id}", "${var.protocol}"
    ]
  security_group_id = "${var.security_group_id}"
}