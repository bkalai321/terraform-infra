output "subnet_id" {
  description = "Subnet ids"
  value       = module.private_subnet.*.subnet_id
}

output "subnet_arn" {
  description = "Subnet Arn"
  value       = module.private_subnet.*.subnet_arn
}

output "subnet_availability_zone" {
  description = "Subnet AZ"
  value       = module.private_subnet.*.subnet_availability_zone
}

output "subnet_cidr_block" {
  description = "Subnet Cidr Blocks"
  value       = module.private_subnet.*.subnet_cidr_block
}