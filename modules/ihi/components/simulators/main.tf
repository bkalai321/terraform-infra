provider "aws" {
  region = "${var.aws_region}"
}

module "security_group" {
  source    = "../../../aws/ec2/securitygroup"
  vpc_id    = "${var.vpc_id}"
  name      = "${var.name}"
  component = "${var.component}"
}

module "security_group_rule" {
  source = "../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress",
    "443",
    "443",
    "0.0.0.0/0",
    "tcp",
    "ingress",
    "-1",
    "-1",
    "18.209.77.206/32:10.201.0.0/16:99.43.125.145/32:99.43.125.146/32:99.43.125.147/32:10.40.0.0/16:192.168.0.0/16",
    "-1",
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
  ]

  security_group_id = "${module.security_group.id}"
}

module "simulators_key_pair" {
  source     = "../../../aws/ec2/keypair"
  component  = "${var.component}"
  name       = "${var.name}"
  public_key = "${file("files/public-keys.txt")}"
}

module "simulators_iam_profile" {
  source         = "../../../aws/iam/service"
  name           = "${var.name}"
  component      = "${var.component}"
  policy_content = "${file("files/iam-profile-simulators.json")}"
}

module "simulator1" {
  source = "../../../aws/ec2/ec2"

  subnet_id            = "${var.subnet_id}"
  availability_zone    = "${var.availability_zone}"
  user_data            = "${file(var.user_data)}"
  key_pair             = "${module.simulators_key_pair.aws_key_pair_name}"
  ami                  = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${module.security_group.id}"]
  iam_instance_profile = "${module.simulators_iam_profile.iam_instance_profile_name}"
  name                 = "${var.name}"
  component            = "${var.component}"
  jenkinsUser          = "${var.jenkinsUser}"
  build_url            = "${var.build_url}"
  folderPath           = "${var.folderPath}"
  terminateInHrs       = "${var.terminateInHrs}"
}

# module "simulator2" {
#   source = "../../../aws/ec2/ec2"

#   subnet_id            = "${var.subnet_id}"
#   availability_zone    = "${var.availability_zone}"
#   user_data            = "${file(var.user_data)}"
#   key_pair             = "${module.simulators_key_pair.aws_key_pair_name}"
#   ami                  = "${var.image_id}"
#   instance_type        = "${var.instance_type}"
#   security_groups      = ["${module.security_group.id}"]
#   iam_instance_profile = "${module.simulators_iam_profile.iam_instance_profile_name}"
#   name                 = "${var.name}"
#   component            = "simulator2"
#   jenkinsUser          = "${var.jenkinsUser}"
#   build_url            = "${var.build_url}"
#   folderPath           = "${var.folderPath}"
# }

# module "simulator3" {
#   source = "../../../aws/ec2/ec2"

#   subnet_id = "${var.subnet_id}"
#   availability_zone = "${var.availability_zone}"
#   user_data = "${file(var.user_data)}"
#   key_pair = "${module.simulators_key_pair.aws_key_pair_name}"
#   ami = "${var.image_id}"
#   instance_type = "${var.instance_type}"
#   security_groups = ["${module.security_group.id}"]
#   iam_instance_profile = "${module.simulators_iam_profile.iam_instance_profile_name}"
#   name = "${var.name}"
#   component = "simulator3"
#   jenkinsUser = "${var.jenkinsUser}"
# }
locals {
  simulator1_name = "${module.simulator1.name}-${module.simulator1.component}-bms"

  # simulator2_name = "${module.simulator2.name}-${module.simulator2.component}-inverter"

  # simulator3_name = "${module.simulator3.name}-${module.simulator3.component}-dc"
}

module "simulators1_route53_record" {
  source             = "../../../aws/route53/record"
  hosted_zone_id     = "${var.hosted_zone_id}"
  domain_name        = "${local.simulator1_name}"
  hosted_domain_name = "${var.hosted_domain_name}"
  dns_type           = "A"
  record_ips         = ["${module.simulator1.instance_private_ip}"]
}

# module "simulators2_route53_record" {
#   source             = "../../../aws/route53/record"
#   hosted_zone_id     = "${var.hosted_zone_id}"
#   domain_name        = "${local.simulator2_name}"
#   hosted_domain_name = "${var.hosted_domain_name}"
#   dns_type           = "A"
#   record_ips         = ["${module.simulator2.instance_private_ip}"]
# }


# module "simulators3_route53_record" {
#   source             = "../../../aws/route53/record"
#   hosted_zone_id     = "${var.hosted_zone_id}"
#   domain_name        = "${local.simulator3_name}"
#   hosted_domain_name = "${var.hosted_domain_name}"
#   dns_type           = "A"
#   record_ips         = ["${module.simulator3.instance_private_ip}"]
# }

