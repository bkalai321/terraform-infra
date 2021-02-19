provider "aws" {
  region = "${var.aws_region}"
}

module "dns_forwarder_sg" {
  source = "../../../aws/ec2/securitygroup"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  name = "${data.terraform_remote_state.vpc.vpc_name}"
  component = "${var.component}"
}

module "dns_forwarder_key_pair" {
  source = "../../../aws/ec2/keypair"
  component = "${var.component}"
  name = "${data.terraform_remote_state.vpc.vpc_name}"
  public_key = "${file("files/public-keys.txt")}"
}

module "dns_forwarder_iam_profile" {
  source = "../../../aws/iam/service"
  name = "${data.terraform_remote_state.vpc.vpc_name}"
  component = "${var.component}"
  policy_content = "${file("files/iam-profile-dns_forwarder.json")}"
}

# resource "aws_network_interface" "dns_forwarder_ip" {
#   subnet_id       = "${element(data.terraform_remote_state.vpc.private_subnets_id, 0)}"
#   private_ips     = ["${cidrhost(element(data.terraform_remote_state.vpc.private_subnets_cidr_block, 0), 5)}"]
#   security_groups = ["${module.dns_forwarder_sg.id}"]
#   tags {
#     Name = "${data.terraform_remote_state.vpc.vpc_name}-${var.component}-static-ip"
#   }
# }

# data "template_file" "userdata" {
#   template = "${file("files/dns_forwarder-userdata.sh")}"

#   vars {
#     INTERFACE_ID = "${aws_network_interface.dns_forwarder_ip.id}"
#   }
# }

module "dns_forwarder" {
  source = "../../../aws/ec2/ec2/fix-ip"

  user_data = "${file("files/dns_forwarder-userdata.sh")}"
  availability_zone = "${element(data.terraform_remote_state.vpc.private_subnet_availability_zone,0)}"
  key_pair = "${module.dns_forwarder_key_pair.aws_key_pair_name}"
  ami = "${var.image_id}"
  instance_type = "t2.micro"
  security_groups = ["${module.dns_forwarder_sg.id}"]
  subnet_id = "${element(data.terraform_remote_state.vpc.private_subnets_id,0)}"
  iam_instance_profile = "${module.dns_forwarder_iam_profile.iam_instance_profile_name}"
  private_ip_address = "${cidrhost(element(data.terraform_remote_state.vpc.private_subnets_cidr_block, 0), 5)}"
  name = "${data.terraform_remote_state.vpc.vpc_name}"
  component = "${var.component}"
}