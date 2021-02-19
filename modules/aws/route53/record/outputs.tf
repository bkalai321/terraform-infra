output "domain_name" {
  value = aws_route53_record.main.name
}

output "fqdn" {
  value = aws_route53_record.main.fqdn
}

