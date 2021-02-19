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

module "add_rules_to_sg" {
  source = "../../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress", "${var.source_port}", "${var.destination_port}" , "${var.cidr}", "${var.protocol}"
  ]
  security_group_id = "${module.create_security_group.id}"
}

module "add_sg_to_sg" {
  source = "../../../../aws/ec2/securitygroup/security-rule/security-group"

  main_rules = [
    "ingress", "${var.source_port}", "${var.destination_port}" , "${module.create_security_group.id}", "${var.protocol}"
    ]
  security_group_id = "${var.security_group_id}"
}

