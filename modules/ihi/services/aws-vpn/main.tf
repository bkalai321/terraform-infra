
provider "aws" {
  region = var.aws_region
}

module "aws_vpn" {
  source = "../../../aws/vpn/"
  name = var.name
  aws_region = var.aws_region
  vpn_gateway_id = var.vpn_gateway_id
  vpc_id = var.vpc_id
  customer_gateway_ip = var.customer_gateway_ip
  vpc_routing_table_ids = var.vpc_routing_table_ids
  psksecret = var.psksecret
  destination_cidr_block = var.destination_cidr_block
}