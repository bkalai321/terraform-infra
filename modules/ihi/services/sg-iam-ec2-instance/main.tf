provider "aws" {
  region = var.aws_region
}

module "vpcLocals" {
  source = "../../../data-vpc"
  aws_region = var.aws_region
}

module "sg" {
  source    = "../../../aws/ec2/securitygroup"
  vpc_id    = local.vpc_id
  name      = var.name
  component = var.component
}

module "sg_rule" {
  source = "../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress",
    "-1",
    "-1",
    "18.209.77.206/32:10.201.0.0/16:99.43.125.145/32:10.40.0.0/16:192.168.0.0/21",
    "-1",
    "egress",
    "0",
    "0",
    "0.0.0.0/0",
    "-1",
  ]
  security_group_id = module.sg.id
}


module "iam_instance_profile" {
  source = "../../../aws/iam/service"
  name      = var.name
  component = var.component
  policy_content = "${file(var.policy_file_name)}"
}
