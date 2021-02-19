output "security_group_id" {
  value = module.jenkins_sg.id
}

output "elb_url" {
  value = module.jenkins_elb.dns_name
}

