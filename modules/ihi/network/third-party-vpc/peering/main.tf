provider "aws" {
  region = "${var.aws_region}"
}

module "vpc_peering" {
  source = "../../../../aws/vpc/vpc-peering"

  peer_owner_id = "${var.peer_owner_id}"
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id = "${var.vpc_id}"
  name = "${var.name}"
  peer_name = "${var.peer_name}"
  auto_accept_peering = "${var.auto_accept_peering}"
}

module "vpc_peering_route" {
  source = "../../../../aws/vpc/route/vpc-peering"

  destination_cidr_block = "${var.destination_cidr_block}"
  availability_zones = "${var.private_az}"
  vpc_peering_connection_id = ["${module.vpc_peering.id}"]
  route_table_id = "${var.nat_route_table_id}"
}

module "vpc_peering_internet_route" {
  source = "../../../../aws/vpc/route/vpc-peering"

  destination_cidr_block = "${var.destination_cidr_block}"
  availability_zones = ["${var.public_az}"]
  vpc_peering_connection_id = ["${module.vpc_peering.id}"]
  route_table_id = "${var.internet_route_table_id}"
}

