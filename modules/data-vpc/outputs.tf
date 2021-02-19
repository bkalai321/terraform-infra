output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "public_subnet" {
  value = data.terraform_remote_state.vpc.outputs.public_subnets_id
}

output "public_subnets_cidr_block" {
  value = data.terraform_remote_state.vpc.outputs.public_subnets_cidr_block
}

output "public_subnet_availability_zone" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_availability_zone
}

output "vpc_cidr_block" {
  value = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}

output "private_subnets_cidr_block" {
  value = data.terraform_remote_state.vpc.outputs.private_subnets_cidr_block
}

output "private_subnet_availability_zone" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_availability_zone
}

output "private_subnet" {
  value = data.terraform_remote_state.vpc.outputs.private_subnets_id
}

output "nat_gateway_id" {
  value = data.terraform_remote_state.vpc.outputs.nat_gateway_id
}

output "nat_gateway_public_ip" {
  value = data.terraform_remote_state.vpc.outputs.nat_gateway_public_ip
}

output "office_ip_cidr_block" {
  value = data.terraform_remote_state.vpc.outputs.office_ip_cidr_block
}

output "office_vpn_cidr_block" {
  value = data.terraform_remote_state.vpc.outputs.office_vpn_cidr_block
}

####route 53
output "hosted_domain_name" {
  value = data.terraform_remote_state.vpc.outputs.hosted_domain_name
}

output "private_hosted_zone_id" {
  value = data.terraform_remote_state.vpc.outputs.private_hosted_zone_id
}
