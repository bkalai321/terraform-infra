variable name {}
variable component {}
variable "aws_region" {}
variable "cidr_internet_route_cidr_block" {}
variable "cidr_private_route_cidr_block" {}
variable "create_vpc" {}
variable "domain_name" {}
variable "domain_name_servers" { type = "list" }
variable "environment" {}
# variable "private_subnets" { type = "list"}
variable "private_subnets_az" { type = "list" }
# variable "public_subnets" { type = "list"}
variable "public_subnets_az" { type = "list" }
variable "vpc_cidr_block" {}

variable "ingress_from_port" {}
variable "ingress_to_port" {}
variable "ingress_protocol" {}
variable "ingress_sg_cidr_blocks" {}
variable "egress_from_port" {}
variable "egress_to_port" {}
variable "egress_protocol" {}
variable "egress_sg_cidr_blocks" { description = "Get variables separated by , in string format. Using split to create list"}


variable "main_rule_cidr_blocks" {}
variable "main_rule_type" {}
variable "main_rule_to_port" {}
variable "main_rule_from_port" {}
variable "main_rule_protocol" {}

variable "openvpn_main_rule_cidr_blocks" {}
variable "openvpn_main_rule_type" {}
variable "openvpn_main_rule_to_port" {}
variable "openvpn_main_rule_from_port" {}
variable "openvpn_main_rule_protocol" {}

variable "endpoints_prefix_list_ids" {}

variable "asg_min" {}
variable "asg_max" {}
variable "image_id" {}
variable "instance_type" {}

variable "openvpn_asg_min" {}
variable "openvpn_asg_max" {}
variable "openvpn_image_id" {}
variable "openvpn_instance_type" {}
variable "openvpn_component" {}
variable "openvpn_associate_public_ip_address" {}
variable "office_ip_cidr_format" {}
variable "office_ip" {}
variable "old_vpc_cidr" {}

