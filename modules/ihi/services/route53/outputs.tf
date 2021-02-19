output "domain_name" {
  value = "${module.route53_record.domain_name}"
}
output "fqdn" {
  value = "${module.route53_record.fqdn}"
}