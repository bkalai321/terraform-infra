resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = "${var.domain_name}.${var.hosted_domain_name}"
  type    = var.type
  ttl     = var.ttl
  records = [var.record_value]
}

