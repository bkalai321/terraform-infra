provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "../../../aws/vpc"
  cidr_block  = var.vpc_cidr_block
  name        = var.name
  environment = var.environment
}

module "private_subnet" {
  source = "../../../aws/vpc/subnet"

  availability_zone = var.private_az
  vpc_id            = module.vpc.vpc_id
  vpc_cidr_block    = module.vpc.vpc_cidr_block
  octet_bit         = "8"
  third_octet       = "10"
  last_octet        = "10"
  name              = var.name
  component         = "private"
}

module "public_subnet" {
  source = "../../../aws/vpc/subnet"

  availability_zone       = var.public_az
  vpc_id                  = module.vpc.vpc_id
  vpc_cidr_block          = module.vpc.vpc_cidr_block
  octet_bit               = "8"
  third_octet             = "10"
  last_octet              = "100"
  name                    = var.name
  component               = "public"
  map_public_ip_on_launch = "true"
}

module "network_acl" {
  source = "../../../aws/vpc/acl"

  name      = var.name
  component = "default"

  vpc_id = module.vpc.vpc_id
  subnet_ids = distinct(
    concat(
      module.public_subnet.subnet_id,
      module.private_subnet.subnet_id,
    ),
  )

  main_network_acl_egress_rules = [
    "-1",
    "100",
    "allow",
    "0.0.0.0/0",
    "0",
    "0",
    "Allow everything to go to VPC",
  ]
  main_network_acl_ingress_rules = [
    "-1",
    "100",
    "allow",
    "0.0.0.0/0",
    "0",
    "0",
    "Allow everything from VPC",
  ]
}

module "internet_gateway" {
  source = "../../../aws/vpc/gateway/internet"

  vpc_id             = module.vpc.vpc_id
  availability_zones = [var.public_az]
  name               = var.name
  environment        = var.environment
}

module "nat_gateway" {
  source = "../../../aws/vpc/gateway/nat"

  availability_zones = [ for az in var.private_az: az ]
  subnet_id          = [ for subnets in module.public_subnet.subnet_id: subnets ]
  private_subnet_id  = [ for subnets in module.private_subnet.subnet_id: subnets ]
  name               = var.name
  environment        = var.environment
}

module "nat_route_table" {
  source = "../../../aws/vpc/route-table/nat"

  vpc_id             = module.vpc.vpc_id
  availability_zones = [ for az in var.private_az: az ]
  subnet_id          = [ for subnets in module.private_subnet.subnet_id: subnets ]
  #cidr_block         = var.all_public_ip_cidr
  cidr_block         = ["0.0.0.0/0", "0.0.0.0/0"]
  nat_gateway_id     = module.nat_gateway.nat_gateway_id

  name = var.name
}

module "internet_route_table" {
  source = "../../../aws/vpc/route-table/internet"

  vpc_id             = module.vpc.vpc_id
  name               = var.name
  availability_zones = [ for az in var.public_az: az ]
  cidr_block         = var.all_public_ip_cidr
  gateway_id         = [ for gateway in module.internet_gateway.internet_gateway_id: gateway ]
  subnet_id          = [ for subnets in module.public_subnet.subnet_id: subnets ]
}

module "nat_route_association" {
  source = "../../../aws/vpc/route-table/association"

  availability_zones = [ for az in var.private_az: az ]

  subnet_id      = [ for subnets in module.private_subnet.subnet_id: subnets ]
  route_table_id = [ for routes in module.nat_route_table.route_id: routes ]
}

module "internet_route_association" {
  source = "../../../aws/vpc/route-table/association"

  availability_zones = [ for az in var.public_az: az ]
  subnet_id          = [ for subnets in module.public_subnet.subnet_id: subnets ]
  route_table_id     = [ for routes in module.internet_route_table.route_id: routes ]
}

module "route53_zone" {
  source             = "../../../aws/route53/zone"
  vpc_region         = var.aws_region
  vpc_id             = module.vpc.vpc_id
  name               = var.name
  hosted_domain_name = "aws.ihies.com"
}

module "route53_association" {
  source = "../../../aws/route53/vpc-association"

  vpc_domain_hosted_zone_id = module.route53_zone.private_hosted_zone_id
  vpc_id = var.old_vpc_id
}

