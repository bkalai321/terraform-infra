output "route_id" {
  description = "Nat gateway Route id"
  value       = aws_route_table.main.*.id
}

