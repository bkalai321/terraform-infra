resource "aws_route53_record" "main" {
  zone_id = var.hosted_zone_id

    records = var.record_ips

  name    = "${local.domain_name}.${var.hosted_domain_name}"
  type    = var.dns_type
  ttl     = var.dns_ttl

  weighted_routing_policy {
    weight = var.domain_name_weight
  }

  set_identifier = var.domain_name
}

locals {
  domain_name = element(
    split(format(".%s", var.hosted_domain_name), var.domain_name),
    0,
  )
}

