output "certificate_id" {
  value = aws_acm_certificate.main.id
}

output "certificate_arn" {
  value = aws_acm_certificate.main.arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.main.domain_validation_options
}

output "cert_dns_validate_domain_name" {
  value = aws_acm_certificate.main.domain_name
}

output "cert_dns_validate_resource_record_name" {
  value = aws_acm_certificate.main.domain_validation_options[0].resource_record_name
}

output "cert_dns_validate_resource_record_type" {
  value = aws_acm_certificate.main.domain_validation_options[0].resource_record_type
}

output "cert_dns_validate_resource_record_value" {
  value = aws_acm_certificate.main.domain_validation_options[0].resource_record_value
}

