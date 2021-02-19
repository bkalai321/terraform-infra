output "nat_gateway_id" {
  description = "Nat gateway id"
  value       = aws_nat_gateway.main.*.id
}

output "nat_gateway_public_ip" {
  description = "Nat gateway public ip"
  value       = aws_nat_gateway.main.*.public_ip
}

output "nat_gateway_private_ip" {
  description = "Nat gateway private ip"
  value       = aws_nat_gateway.main.*.private_ip
}

output "eip_id" {
  description = "EIP ID for Nat use"
  value       = aws_eip.main.*.id
}

output "eip_private_ip" {
  description = "EIP Private IP for Nat use"
  value       = aws_eip.main.*.private_ip
}

output "eip_public_ip" {
  description = "EIP Public IP for Nat use"
  value       = aws_eip.main.*.public_ip
}

