provider "aws" {
  region = "${var.aws_region}"
}

module "vpc_peering" {
  source = "../../../aws/vpc/vpc-peering"
  peer_owner_id = "${var.owner_id}" 
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id = "${var.vpc_id}"
  name = "${var.name}"
  peer_name = "${var.components}"
  peer_aws_region = "${var.peer_aws_region}"
  auto_accept_peering = "${var.auto_accept == "true" ? "false" : "true" }"
}

