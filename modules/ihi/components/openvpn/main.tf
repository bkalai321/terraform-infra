provider "aws" {
  region = var.aws_region
}

module "openvpn_sg" {
  source    = "../../../aws/ec2/securitygroup"
  vpc_id    = data.terraform_remote_state.vpc.outputs.vpc_id
  name      = var.name
  component = var.component
}

module "openvpn_sg_rule" {
  source = "../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress",
    "443",
    "443",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "22",
    "22",
    "18.209.77.206/32:${data.terraform_remote_state.vpc.outputs.vpc_cidr_block}:99.43.125.145/32:10.40.0.0/16",
    "tcp",
    "egress",
    "0",
    "0",
    "0.0.0.0/0",
    "-1",
    "ingress",
    "80",
    "80",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "1194",
    "1194",
    "0.0.0.0/0",
    "udp",
  ]
  security_group_id = module.openvpn_sg.id
}

module "openvpn_key_pair" {
  source     = "../../../aws/ec2/keypair"
  component  = var.component
  name       = var.name
  public_key = file("files/public-keys.txt")
}

module "openvpn_iam_profile" {
  source         = "../../../aws/iam/service"
  name           = var.name
  component      = var.component
  policy_content = file("files/iam-profile-openvpn.json")
}

module "openvpn" {
  source              = "../../../aws/ec2/asg/ec2"
  vpc_zone_identifier = [for subnets in data.terraform_remote_state.vpc.outputs.public_subnets_id: subnets ]
  availability_zones  = [for az in data.terraform_remote_state.vpc.outputs.public_subnet_availability_zone: az]

  myVersion = "1.0"

  asg_min_size                = "1"
  asg_max_size                = "1"
  name                        = var.name
  component                   = "openvpn"
  image_id                    = var.image_id
  instance_type               = "m4.large"
  iam_instance_profile        = module.openvpn_iam_profile.iam_instance_profile_name
  security_groups             = [module.openvpn_sg.id]
  aws_key_pair_name           = module.openvpn_key_pair.aws_key_pair_name
  user_data                   = file("files/openvpn-userdata.sh")
  associate_public_ip_address = "true"
}

