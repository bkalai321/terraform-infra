output "id" {
  description = "VPC peering Gateway route id"
  value       = aws_route_table.main.id
}

output "owner_id" {
  value = aws_route_table.main.owner_id
}

