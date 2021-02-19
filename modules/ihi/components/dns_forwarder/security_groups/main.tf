provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-east-1"
}

module "dns_forwarder_sg_rule" {
  source = "../../../../aws/ec2/securitygroup/security-rule/cidr"

  count = "3"
  main_rules = [
    "ingress", "53", "53" , "10.201.0.0/16", "udp", 
    "egress", "0", "0", "0.0.0.0/0", "-1", 
    "ingress", "0", "0" , "192.168.0.0/21", "-1",
  ]
  security_group_id = "${data.terraform_remote_state.dns_forwarder.security_group_id}"
}
