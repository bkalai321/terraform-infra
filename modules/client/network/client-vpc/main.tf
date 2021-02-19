provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source = "../../../aws/vpc"
  cidr_block = "${var.vpc_cidr_block}"
  name = "${var.name}"
  environment = "${var.environment}"
}

module "private_subnet" {
  source = "../../../aws/vpc/subnet"
  availability_zone = ["${var.private_az}"]
  vpc_id = "${module.vpc.vpc_id}"
  vpc_cidr_block = "${module.vpc.vpc_cidr_block}"
  octet_bit = "8"
  third_octet = "10"
  last_octet = "10"
  name = "${var.name}"
  component = "private"
}

module "public_subnet" {
  source = "../../../aws/vpc/subnet"
  availability_zone = ["${var.public_az}"]
  vpc_id = "${module.vpc.vpc_id}"
  vpc_cidr_block = "${module.vpc.vpc_cidr_block}"
  octet_bit = "8"
  third_octet = "10"
  last_octet = "100"
  name = "${var.name}"
  component = "public"
  map_public_ip_on_launch = "true"
}

module "network_acl" {
  source = "../../../aws/vpc/acl"
  name = "${var.name}"
  component = "default-acl"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_ids = ["${distinct(concat(module.public_subnet.subnet_id,module.private_subnet.subnet_id))}"]
  main_network_acl_egress_rules = [
    "-1", "100", "allow", "0.0.0.0/0", "0", "0", "Allow everything to go to VPC"
  ]
  main_network_acl_ingress_rules = [
    "-1", "100", "allow", "0.0.0.0/0", "0", "0", "Allow everything from VPC"
  ]
}

module "internet_gateway" {
  source = "../../../aws/vpc/gateway/internet"
  vpc_id = "${module.vpc.vpc_id}"
  availability_zones = ["${var.public_az}"]
  name = "${var.name}"
  environment = "${var.environment}"
}

module "nat_gateway" {
  source = "../../../aws/vpc/gateway/nat"
  availability_zones = ["${var.private_az}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
  name = "${var.name}"
  environment = "${var.environment}"
}

module "nat_route_table" {
  source = "../../../aws/vpc/route-table/nat"
  vpc_id = "${module.vpc.vpc_id}"
  availability_zones = ["${var.private_az}"]
  subnet_id = ["${module.private_subnet.subnet_id}"]
  cidr_block = ["${var.all_public_ip_cidr}"]
  nat_gateway_id = ["${module.nat_gateway.nat_gateway_id}"]
  name = "${var.name}"
}

module "internet_route_table" {
  source = "../../../aws/vpc/route-table/internet"
  vpc_id = "${module.vpc.vpc_id}"
  name = "${var.name}"
  availability_zones = ["${var.public_az}"]
  cidr_block = ["${var.all_public_ip_cidr}"]
  gateway_id = ["${module.internet_gateway.internet_gateway_id}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
}

module "nat_route_association" {
  source = "../../../aws/vpc/route-table/association"
  availability_zones = ["${var.private_az}"]
  subnet_id = ["${module.private_subnet.subnet_id}"]
  route_table_id = ["${module.nat_route_table.route_id}"]
}

module "internet_route_association" {
  source = "../../../aws/vpc/route-table/association"
  availability_zones = ["${var.public_az}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
  route_table_id = ["${module.internet_route_table.route_id}"]
}

module "route53_zone" {
  source = "../../../aws/route53/zone"
  vpc_region = "${var.aws_region}"
  vpc_id = "${module.vpc.vpc_id}"
  name = "${var.name}"
  hosted_domain_name = "${var.hosted_domain_name}"
}

module "route53_zone_association" {
  source = "../../../aws/route53/vpc-association"
  vpc_domain_hosted_zone_id = "${module.route53_zone.private_hosted_zone_id}"
  vpc_id = "${var.hosted_domain_new_vpc_id}"
}

module "vpn_gateway" {
  source = "../../../aws/vpc/gateway/virtual-private-gateways"
  name = "${var.name}"
  component = "${var.component}"
}

module "vpn_gateway_attachment" {
  source = "../../../aws/vpc/gateway/virtual-private-gateways/attachment"
  vpc_id = "${module.vpc.vpc_id}"
  vpn_gateway_id = "${module.vpn_gateway.id}"
}

module "vpn_gateway_route_propagation" {
  source = "../../../aws/vpc/gateway/virtual-private-gateways/route-table-propogation"
  vpn_gateway_id = "${module.vpn_gateway.id}"
  route_table_id = ["${module.nat_route_table.route_id}"]
  count = "2"
}

module "customer_gateway" {
  source = "../../../aws/vpc/gateway/customer-gateways"
  office_ip_addr_cidr = "${var.office_ip_cidr}"
  name = "${var.name}"
  component = "${var.component}"
}

module "aws_vpn_connection" {
  source = "../../../aws/vpc/vpn-connections"
  customer_gateway_id = "${module.customer_gateway.id}"
  vpn_gateway_id = "${module.vpn_gateway.id}"
  name = "${var.name}"
  component = "${var.component}"
}

module "aws_vpn_connection_route" {
  source = "../../../aws/vpc/vpn-connections/connection-route"
  destination_cidr_block = ["192.168.0.0/21"]
  vpn_connection_id = "${module.aws_vpn_connection.id}"
}



