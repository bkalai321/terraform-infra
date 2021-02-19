provider "aws" {
  region = "${var.aws_region}"
}

module "pilot_sg" {
  source    = "../../../aws/ec2/securitygroup"
  vpc_id    = "${var.vpc_id}"
  name      = "${var.name}"
  component = "${var.component}"
}

module "pilot_sg_rule" {
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
    "18.209.77.206/32:10.201.0.0/16:99.43.125.145/32:99.43.125.146/32:99.43.125.147/32:10.40.0.0/16:192.168.1.0/24",
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
    "ingress",
    "-1",
    "-1",
    "192.168.0.0/16",
    "-1",
  ]

  security_group_id = "${module.pilot_sg.id}"
}

module "pilot_key_pair" {
  source     = "../../../aws/ec2/keypair"
  component  = "${var.component}"
  name       = "${var.name}"
  public_key = "${file("files/public-keys.txt")}"
}

module "pilot_iam_profile" {
  source         = "../../../aws/iam/service"
  name           = "${var.name}"
  component      = "${var.component}"
  policy_content = "${file("files/iam-profile-pilot.json")}"
}

module "instance" {
  source = "../../../aws/ec2/ec2"

  subnet_id = "${var.subnet_id}"
  availability_zone = "${var.availability_zone}"
  user_data = "${file(var.user_data)}"
  key_pair = "${module.pilot_key_pair.aws_key_pair_name}"
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${module.pilot_sg.id}"]
  iam_instance_profile = "${module.pilot_iam_profile.iam_instance_profile_name}"
  name                 = "${var.name}"
  component            = "${var.component}"
  jenkinsUser          = "${var.jenkinsUser}"
  build_url            = "${var.build_url}"
  folderPath           = "${var.folderPath}"
  versionNumber        = "${var.versionNumber}"
  terminateInHrs       = "${var.terminateInHrs}"
}

module "jenkins_route53_record" {
  source             = "../../../aws/route53/record"
  hosted_zone_id     = "${var.hosted_zone_id}"
  domain_name        = "${var.domain_name}"
  hosted_domain_name = "${var.hosted_domain_name}"
  dns_type           = "A"
  record_ips         = ["${module.instance.instance_private_ip}"]
}
