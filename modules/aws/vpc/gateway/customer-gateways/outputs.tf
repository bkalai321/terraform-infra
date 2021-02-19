output "id" {
  value = aws_customer_gateway.main.id
}

output "bgp_asn" {
  value = aws_customer_gateway.main.bgp_asn
}

# output "ip_address" {
#   value = "${aws_customer_gateway.main.ip_address}"
# }
output "type" {
  value = aws_customer_gateway.main.type
}

output "tags" {
  value = aws_customer_gateway.main.tags
}

