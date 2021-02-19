provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

module "jenkins_sg_rule" {
  source = "../../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress",
    "0",
    "0",
    "10.201.0.0/16",
    "-1",
    "egress",
    "0",
    "0",
    "0.0.0.0/0",
    "-1",
    "ingress",
    "0",
    "0",
    "192.168.1.0/24",
    "-1",
    "ingress",
    "0",
    "0",
    "10.40.0.0/16",
    "-1",
  ]
  security_group_id = data.terraform_remote_state.jenkins.outputs.security_group_id
}

