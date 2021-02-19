output "public_ip" {
  value = aws_eip.main.public_ip
}

output "network_interface" {
  value = aws_eip.main.network_interface
}

