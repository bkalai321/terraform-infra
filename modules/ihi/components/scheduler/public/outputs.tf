output "instance_ip" {
  value = module.instance.instance_private_ip
}

output "instance_id" {
  value = module.instance.instance_id
}

output "eip" {
  value = module.eip.public_ip
}

# output "eip_dns" {
#   value = module.eip.public_dns
# }

