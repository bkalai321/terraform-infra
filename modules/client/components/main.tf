provider "aws" {
  region = "${var.aws_region}"
}

module "security_group" {
  source = "../../../aws/ec2/securitygroup"
  vpc_id = "${var.vpc_id}"
  name = "${var.name}"
  component = "${var.component}"
}

module "key_pair" {
  source = "../../../aws/ec2/keypair"
  component = "${var.component}"
  name = "${var.name}"
  public_key = "${file("files/public-keys.txt")}"
}

module "pilot_instance_profile" {
  source = "../../../aws/iam/service"
  name = "${var.name}"
  component = "${var.component}"
  policy_content = "${file("files/pilot_instance_profile.json")}"
}

module "domain_controller" {
  source = "../../../aws/ec2/ec2/fix-ip"

  user_data = "${file("files/domain_controller_userdata.sh")}"
  availability_zone = "${var.private_az}"
  key_pair = "${module.key_pair.aws_key_pair_name}"
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${module.security_group.id}"]
  subnet_id = "${var.subnet_id}"
  iam_instance_profile = "${module.pilot_instance_profile.iam_instance_profile_name}"
  private_ip_address = "${var.domain_controller_private_ip}"
  name = "${var.name}"
  component = "domain-controller"
}

module "zone_controller" {
  source = "../../../aws/ec2/ec2/fix-ip"

  user_data = "${file("files/zone_controller_userdata.sh")}"
  availability_zone = "${var.private_az}"
  key_pair = "${module.key_pair.aws_key_pair_name}"
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${module.security_group.id}"]
  subnet_id = "${var.subnet_id}"
  iam_instance_profile = "${module.pilot_instance_profile.iam_instance_profile_name}"
  private_ip_address = "${var.zone_controller_private_ip}"
  name = "${var.name}"
  component = "zone-controller"
}