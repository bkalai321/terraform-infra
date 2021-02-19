output "hostname" {
  value = "${module.jenkins_route53_record.fqdn}"
}

output "host_ip" {
  value = "${module.instance.instance_private_ip}"
}

output "instance_id" {
  value = "${module.instance.instance_id}"
}