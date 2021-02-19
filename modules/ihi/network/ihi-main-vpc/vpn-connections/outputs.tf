output "customer_gateway_configuration" {
  value = module.aws_vpn_connection.customer_gateway_configuration
}

# output "vpn_gateway_id" {
#   value = "${module.vpn_gateway.id}"
# }
# output "customer_gateway_id" {
#   value = "${module.customer_gateway.id}"
# }
output "vpn_connection_id" {
  value = module.aws_vpn_connection.id
}

# output "th_customer_gateway_configuration" {
#   value = "${module.th_aws_vpn_connection.customer_gateway_configuration}"
# }
