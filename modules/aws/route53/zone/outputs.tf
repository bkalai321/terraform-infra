output "private_hosted_zone_id" {
  value = aws_route53_zone.private.zone_id
}

output "private_hosted_name_servers" {
  value = aws_route53_zone.private.name_servers
}

output "hosted_domain_name" {
  value = var.hosted_domain_name
}

output "public_hosted_zone_id" {
  value = aws_route53_zone.public.zone_id
}

output "public_hosted_name_servers" {
  value = aws_route53_zone.public.name_servers
}

