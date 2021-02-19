provider "aws" {
  region = "${var.aws_region}"
}

module "add_routes" {
  source = "../../../aws/vpc/route-table/vpc-peering"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.cidr_block}"
  vpc_peering_connection_id = "${var.vpc_peering_connection_id}"
  name = "${var.name}"
  component = "${var.component}"
}