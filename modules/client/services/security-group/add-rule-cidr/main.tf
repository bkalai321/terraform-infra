provider "aws" {
  region     = "${var.aws_region}"
}

module "add_rules_to_sg" {
  source = "../../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress", "${var.destination_port}", "${var.source_port}" , "${var.cidr}", "${var.protocol}"
  ]
  security_group_id = "${var.security_group_id}"
}