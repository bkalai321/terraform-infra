provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source = "../../../../aws/vpc"
  cidr_block = "${var.vpc_cidr_block}"
  name = "${var.name}"
  environment = "${var.environment}"
  # dhcp_options_domain_name = "${var.dhcp_options_domain_name}"
  # dhcp_options_domain_name_servers = ["${var.dhcp_options_domain_name_servers}"]
}

module "private_subnet" {
  source = "../../../../aws/vpc/subnet"

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
  source = "../../../../aws/vpc/subnet"

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
  source = "../../../../aws/vpc/acl"

  name = "${var.name}"
  component = "default"

  vpc_id = "${module.vpc.vpc_id}"
  subnet_ids = ["${distinct(concat(module.public_subnet.subnet_id,module.private_subnet.subnet_id))}"]
  # main_network_acl_egress_rules = [
  #   "-1", "100", "allow", "${module.vpc.vpc_cidr_block}", "0", "0", "Allow everything to go to VPC"
  # ]
  # main_network_acl_ingress_rules = [
  #   "-1", "100", "allow", "${module.vpc.vpc_cidr_block}", "0", "0", "Allow everything from VPC"
  # ]

  main_network_acl_egress_rules = [
    "-1", "100", "allow", "0.0.0.0/0", "0", "0", "Allow everything to go to VPC"
  ]
  main_network_acl_ingress_rules = [
    "-1", "100", "allow", "0.0.0.0/0", "0", "0", "Allow everything from VPC"
  ]
}

# module "egress_network_acl_rule" {
#   source = "../../../aws/vpc/acl/nacl-rule"

#   network_acl_id = "${module.network_acl.network_acl_id}"
#   egress = true
#   acl_rules = [
#     "-1", "101", "allow", "${var.office_ip_cidr}", "0", "0", "Allow everything to go to Office Public Ip",
#     "-1", "102", "allow", "${var.old_office_vpc_cidr}", "0", "0", "Allow everything to go to Office Public Ip",
#     "tcp", "115", "allow", "${var.all_public_ip_cidr}", "0", "65535", "Allow everything to go to outside for public address",
#     "udp", "116", "allow", "${var.all_public_ip_cidr}", "1194", "1194", "Allow everything to go to outside for public address"
#   ]
# }

# module "ingress_network_acl_rule" {
#   source = "../../../aws/vpc/acl/nacl-rule"

#   network_acl_id = "${module.network_acl.network_acl_id}"
#   egress = false
#   acl_rules = [
#     "-1", "101", "allow", "${var.office_ip_cidr}", "0", "0", "Allow everything to go to Office Public Ip",
#     "-1", "102", "allow", "${var.office_vpn}", "0", "0", "Allow everything to go to Office Public Ip",
#     "-1", "103", "allow", "${var.old_office_vpc_cidr}", "0", "0", "Allow everything to go to Office Public Ip",
#     "tcp", "105", "allow", "${var.all_public_ip_cidr}", "80", "80", "Allow everything to go to Office Public Ip",
#     "tcp", "110", "allow", "${var.all_public_ip_cidr}", "443", "443", "Allow everything to go to outside for public address",
#     "udp", "115", "allow", "${var.all_public_ip_cidr}", "1194", "1194", "Allow everything to go to outside for public address"
#   ]
# }

module "internet_gateway" {
  source = "../../../../aws/vpc/gateway/internet"

  vpc_id = "${module.vpc.vpc_id}"
  availability_zones = ["${var.public_az}"]
  name = "${var.name}"
  environment = "${var.environment}"
}

module "nat_gateway" {
  source = "../../../../aws/vpc/gateway/nat"

  availability_zones = ["${var.private_az}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
  name = "${var.name}"
  private_subnet_id = ["${module.private_subnet.subnet_id}"]
  environment = "${var.environment}"
}

module "nat_route_table" {
  source = "../../../../aws/vpc/route-table/nat"

  vpc_id = "${module.vpc.vpc_id}"
  availability_zones = ["${var.private_az}"]
  subnet_id = ["${module.private_subnet.subnet_id}"]
  cidr_block = ["${var.all_public_ip_cidr}"]
  nat_gateway_id = ["${module.nat_gateway.nat_gateway_id}"]
  
  name = "${var.name}"
}

module "internet_route_table" {
  source = "../../../../aws/vpc/route-table/internet"

  vpc_id = "${module.vpc.vpc_id}"
  name = "${var.name}"
  availability_zones = ["${var.public_az}"]
  cidr_block = ["${var.all_public_ip_cidr}"]
  gateway_id = ["${module.internet_gateway.internet_gateway_id}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
}

module "nat_route_association" {
  source = "../../../../aws/vpc/route-table/association"

  availability_zones = ["${var.private_az}"]

  subnet_id = ["${module.private_subnet.subnet_id}"]
  route_table_id = ["${module.nat_route_table.route_id}"]
}

module "internet_route_association" {
  source = "../../../../aws/vpc/route-table/association"

  availability_zones = ["${var.public_az}"]
  subnet_id = ["${module.public_subnet.subnet_id}"]
  route_table_id = ["${module.internet_route_table.route_id}"]
}

# module "route53_zone" {
#   source = "../../../aws/route53/zone"
#   vpc_region = "${var.aws_region}"
#   vpc_id = "${module.vpc.vpc_id}"
#   name = "${var.name}"
#   hosted_domain_name = "testaws.ihies.com"
# }

# module "vpc_peering" {
#   source = "../../../aws/vpc/vpc-peering"

#   peer_owner_id = "460093719278"
#   peer_vpc_id = "vpc-0dde0eb0485a63065"
#   vpc_id = "${module.vpc.vpc_id}"
#   name = "${var.name}"
#   peer_name = "ihi-main"
#   auto_accept_peering = "true"
# }

# module "vpc_peering_route" {
#   source = "../../../aws/vpc/route/vpc-peering"

#   destination_cidr_block = ["10.201.0.0/16"]
#   availability_zones = ["${var.private_az}"]
#   vpc_peering_connection_id = ["${module.vpc_peering.id}"]
#   route_table_id = ["${module.nat_route_table.route_id}"]
# }

# module "vpc_peering_internet_route" {
#   source = "../../../aws/vpc/route/vpc-peering"

#   destination_cidr_block = ["10.201.0.0/16"]
#   availability_zones = ["${var.public_az}"]
#   vpc_peering_connection_id = ["${module.vpc_peering.id}"]
#   route_table_id = ["${module.internet_route_table.route_id}"]
# }

