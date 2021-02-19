output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "vpc arn"
  value       = aws_vpc.main.arn
}

output "vpc_cidr_block" {
  description = "vpc cidr_block"
  value       = aws_vpc.main.cidr_block
}

output "owner_id" {
  value = aws_vpc.main.owner_id
}

