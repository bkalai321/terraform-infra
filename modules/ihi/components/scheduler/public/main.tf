provider "aws" {
  region = var.aws_region
}

module "sg" {
  source    = "../../../../aws/ec2/securitygroup"
  vpc_id    = var.vpc_id
  name      = var.name
  component = var.component
}

module "sg_rule" {
  source = "../../../../aws/ec2/securitygroup/security-rule/cidr"

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
    "ingress",
    "3000",
    "3000",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "3001",
    "3001",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "4001",
    "4001",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "4000",
    "4000",
    "0.0.0.0/0",
    "tcp",
  ]
  security_group_id = module.sg.id
}

module "iam_profile" {
  source         = "../../../../aws/iam/service"
  name           = var.name
  component      = var.component
  policy_content = file("files/iam-profile-pilot.json")
}

module "instance" {
  source               = "../../../../aws/ec2/ec2"
  subnet_id            = var.subnet_id
  availability_zone    = var.availability_zone
  user_data            = file(var.user_data)
  ami                  = var.image_id
  instance_type        = var.instance_type
  security_groups      = [module.sg.id]
  iam_instance_profile = module.iam_profile.iam_instance_profile_name
  name                 = var.name
  component            = var.component
  jenkinsUser          = var.jenkinsUser
  build_url            = var.build_url
  folderPath           = var.folderPath
  key_pair             = var.key_pair
  volume_size          = var.volume_size
  terminateInHrs       = var.terminateInHrs
}

module "eip" {
  source      = "../../../../aws/ec2/eip"
  instance_id = module.instance.instance_id
  name        = var.name
  component   = var.component
  environment = "dev"
  private_ip  = module.instance.instance_private_ip
}

