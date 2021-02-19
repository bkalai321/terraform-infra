provider "aws" {
  region = "${var.aws_region}"
}

module "sg" {
  source = "../../../aws/ec2/securitygroup"
  vpc_id = "${var.vpc_id}"
  name = "${var.name}"
  component = "${var.component}"
}

module "sg_rule" {
  source = "../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress", "-1", "-1" , "10.201.0.0/16:10.40.0.0/16:192.168.0.0/21", "-1", 
    "egress", "0", "0", "0.0.0.0/0", "-1", 
  ]
  security_group_id = "${module.sg.id}"
}

module "key_pair" {
  source = "../../../aws/ec2/keypair"
  component = "${var.component}"
  name = "${var.name}"
  public_key = "${file("files/public-keys.txt")}"
}

module "iam_profile" {
  source = "../../../aws/iam/service"
  name = "${var.name}"
  component = "${var.component}"
  policy_content = "${file("files/iam-profile-active-directory.json")}"
}

module "instance" {
  source = "../../../aws/ec2/ec2"

  subnet_id = "${var.subnet_id}"
  availability_zone = "${var.availability_zone}"

  user_data = "${var.user_data}"
  key_pair = "${module.key_pair.aws_key_pair_name}"
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${module.sg.id}"]
  iam_instance_profile = "${module.iam_profile.iam_instance_profile_name}"
  name = "${var.name}"
  component = "${var.component}"
  disable_api_termination = "${var.disable_api_termination}"
}