output "instance_ip" {
  value = "${module.instance.instance_private_ip}"
}

output "instance_id" {
  value = "${module.instance.instance_id}"
}