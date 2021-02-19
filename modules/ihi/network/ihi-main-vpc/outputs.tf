output "vpc_id" {
  value = module.vpc.vpc_id
}

output "owner_id" {
  value = module.vpc.owner_id
}

output "vpc_name" {
  value = var.name
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "public_subnets_id" {
  value = [ for subnets in module.public_subnet.subnet_id: subnets ]
  # value = module.public_subnet.subnet_id
}

output "public_subnets_arn" {
  value = module.public_subnet.subnet_arn
}

output "public_subnets_cidr_block" {
  value = module.public_subnet.subnet_cidr_block
}

output "public_subnet_availability_zone" {
  value = module.public_subnet.subnet_availability_zone
}

output "private_subnets_id" {
  value = module.private_subnet.subnet_id
}

output "private_subnets_arn" {
  value = module.private_subnet.subnet_arn
}

output "private_subnets_cidr_block" {
  value = module.private_subnet.subnet_cidr_block
}

output "private_subnet_availability_zone" {
  value = module.private_subnet.subnet_availability_zone
}

output "network_acl_id" {
  value = module.network_acl.network_acl_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "nat_gateway_public_ip" {
  value = module.nat_gateway.nat_gateway_public_ip
}

output "office_ip_cidr_block" {
  value = var.office_ip_cidr
}

output "office_vpn_cidr_block" {
  value = var.office_vpn
}

####route 53
output "hosted_domain_name" {
  value = module.route53_zone.hosted_domain_name
}

output "private_hosted_zone_id" {
  value = module.route53_zone.private_hosted_zone_id
}

output "private_hosted_name_servers" {
  value = module.route53_zone.private_hosted_name_servers
}

output "public_hosted_zone_id" {
  value = module.route53_zone.public_hosted_zone_id
}

output "public_hosted_name_servers" {
  value = module.route53_zone.public_hosted_name_servers
}

output "nat_route_table_id" {
  value = module.nat_route_table.route_id
}

output "internet_route_table_id" {
  value = module.internet_route_table.route_id
}



