provider "aws" {
  region = "${var.aws_region}"
}

module "route53_record" {
  source = "../../../aws/route53/simple-route53-record"
  zone_id = "${var.zone_id}"
  domain_name = "${var.domain_name}"
  hosted_domain_name = "${var.hosted_domain_name}"
  type = "${var.type}"
  ttl = "${var.ttyl}"
  record_value = "${var.record_value}"
}
