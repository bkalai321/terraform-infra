output "internet_gateway_id" {
  description = "internet gateway id"
  value       = aws_internet_gateway.main.*.id
}

