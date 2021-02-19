output "private_subnet_id" {
  value = "${module.main_vpc.private_subnet_id}"
}

output "public_subnet_id" {
  value = "${module.main_vpc.public_subnet_id}"
}

output "vpc_id" {
  value = "${module.main_vpc.vpc_id}"
}

output "public_azs" {
  value = "${module.main_vpc.subnet_public_az}"
}

output "private_azs" {
  value = "${module.main_vpc.subnet_private_az}"
}

