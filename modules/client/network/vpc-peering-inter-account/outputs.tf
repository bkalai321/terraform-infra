output "id" {
  value = "${module.vpc_peering.id}"
}

output "accept_status" {
  value = "${module.vpc_peering.accept_status}"
}