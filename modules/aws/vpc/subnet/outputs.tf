output "subnet_id" {
  description = "Subnet ids"
  value       = aws_subnet.main.*.id
}

output "subnet_arn" {
  description = "Subnet Arn"
  value       = aws_subnet.main.*.arn
}

output "subnet_availability_zone" {
  description = "Subnet AZ"
  value       = aws_subnet.main.*.availability_zone
}

output "subnet_cidr_block" {
  description = "Subnet Cidr Blocks"
  value       = aws_subnet.main.*.cidr_block
}

