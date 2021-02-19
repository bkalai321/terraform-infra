output "route_id" {
  description = "Internet gateway route id"
  value       = aws_route_table.main.*.id
}

