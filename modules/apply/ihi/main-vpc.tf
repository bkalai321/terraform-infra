provider "aws" {
  region = "${var.aws_region}"
}

module "main_vpc" {
  source = "../../aws/vpc"
  
  cidr_block = "${var.vpc_cidr_block}"  
  cidr_internet_route_cidr_block = "${var.cidr_internet_route_cidr_block}"
  cidr_private_route_cidr_block = "${var.cidr_private_route_cidr_block}"
  create_vpc = "1"
  create_vpc_options = "${var.create_vpc}"
  dhcp_options_domain_name = "${var.domain_name}"
  dhcp_options_domain_name_servers = ["${var.domain_name_servers}"]
  environment = "${var.environment}"
  # private_subnets = ["${var.private_subnets}"]
  private_subnets_az = ["${var.private_subnets_az}"]
  # public_subnets = ["${var.public_subnets}"]
  public_subnets_az = "${var.public_subnets_az}"
  name = "${var.name}" 
}

# module "main_acl_private" {
#   source = "../../aws/vpc/acl"

#   ingress_protocol_1 = "-1"
#   ingress_rule_number_1 = "100"
#   ingress_action_1 = "allow"
#   ingress_cidr_block_1 = "10.0.0.0/8"
#   ingress_from_port_1 = "0"
#   ingress_to_port_1 = "0"

#   ingress_protocol_2 = "-1"
#   ingress_rule_number_2 = "101"
#   ingress_action_2 = "allow"
#   ingress_cidr_block_2 = "${var.client_vpc_cidr}"
#   ingress_from_port_2 = "0"
#   ingress_to_port_2 = "0"

#   ingress_protocol_3 = "-1"
#   ingress_rule_number_3 = "103"
#   ingress_action_3 = "allow"
#   ingress_cidr_block_3 = "75.41.113.250/32"
#   ingress_from_port_3 = "0"
#   ingress_to_port_3 = "0"

#   ingress_protocol_4 = "tcp"
#   ingress_rule_number_4 = "443"
#   ingress_action_4 = "allow"
#   ingress_cidr_block_4 = "0.0.0.0/0"
#   ingress_from_port_4 = "443"
#   ingress_to_port_4 = "443"
  
#   egress_protocol_3 = "-1" 
#   egress_rule_number_3 = "100"
#   egress_action_3 = "allow"
#   egress_cidr_block_3 = "75.41.113.250/32"
#   egress_from_port_3 = "0"
#   egress_to_port_3 = "0"

#   egress_protocol_2 = "-1" 
#   egress_rule_number_2 = "101"
#   egress_action_2 = "allow"
#   egress_cidr_block_2 = "10.0.0.0/8"
#   egress_from_port_2 = "0"
#   egress_to_port_2 = "0"

#   egress_protocol_1 = "tcp" 
#   egress_rule_number_1 = "130"
#   egress_action_1 = "allow"
#   egress_cidr_block_1 = "0.0.0.0/0"
#   egress_from_port_1 = "0"
#   egress_to_port_1 = "0"

#   subnet_id = ["${module.main_vpc.private_subnet_id}"]
#   name = "${var.name}"
#   component = "private"
#   vpc_id = "${element(module.main_vpc.vpc_id, 1)}"
# }

# module "main_acl_public" {
#   source = "../../aws/vpc/acl"

#   ingress_protocol_1 = "-1"
#   ingress_rule_number_1 = "100"
#   ingress_action_1 = "allow"
#   ingress_cidr_block_1 = "10.0.0.0/8"
#   ingress_from_port_1 = "0"
#   ingress_to_port_1 = "0"

#   ingress_protocol_2 = "tcp"
#   ingress_rule_number_2 = "101"
#   ingress_action_2 = "allow"
#   ingress_cidr_block_2 = "0.0.0.0/0"
#   ingress_from_port_2 = "443"
#   ingress_to_port_2 = "443"

#   ingress_protocol_3 = "-1"
#   ingress_rule_number_3 = "103"
#   ingress_action_3 = "allow"
#   ingress_cidr_block_3 = "75.41.113.250/32"
#   ingress_from_port_3 = "0"
#   ingress_to_port_3 = "0"

#   ingress_protocol_4 = "udp"
#   ingress_rule_number_4 = "443"
#   ingress_action_4 = "allow"
#   ingress_cidr_block_4 = "0.0.0.0/0"
#   ingress_from_port_4 = "1194"
#   ingress_to_port_4 = "1194"
  
#   egress_protocol_3 = "-1" 
#   egress_rule_number_3 = "100"
#   egress_action_3 = "allow"
#   egress_cidr_block_3 = "${var.office_ip_cidr_format}"
#   egress_from_port_3 = "0"
#   egress_to_port_3 = "0"

#   egress_protocol_2 = "-1" 
#   egress_rule_number_2 = "101"
#   egress_action_2 = "allow"
#   egress_cidr_block_2 = "${var.vpc_cidr_block}"
#   egress_from_port_2 = "0"
#   egress_to_port_2 = "0"

#   egress_protocol_1 = "tcp" 
#   egress_rule_number_1 = "130"
#   egress_action_1 = "allow"
#   egress_cidr_block_1 = "0.0.0.0/0"
#   egress_from_port_1 = "0"
#   egress_to_port_1 = "65535"

#   subnet_id = ["${module.main_vpc.public_subnet_id}"]
#   name = "${var.name}"
#   component = "public"
#   vpc_id = "${element(module.main_vpc.vpc_id, 1)}"
# }

# module "extra_nacl_rules_public" {
#   source = "../../aws/vpc/acl/nacl-rule"

#   network_acl_id = "${module.main_acl_public.network_acl_id}"
#   rule_number = "152"
#   egress = "false"
#   protocol = "-1"
#   rule_action = "allow"
#   cidr_block = "${var.client_vpc_cidr}"
#   from_port = "0"
#   to_port = "0"
# }

# module "jenkins_master_sg" {
#   source = "../../aws/ec2/securitygroup"
#   vpc_id = "${element(module.main_vpc.vpc_id, 1)}"
#   name = "${var.name}"
#   component = "${var.component}"
#   ingress_from_port = "${var.ingress_from_port}"
#   ingress_to_port = "${var.ingress_to_port}"
#   ingress_protocol = "${var.ingress_protocol}"
#   ingress_sg_cidr_blocks = "${var.ingress_sg_cidr_blocks}"
#   egress_from_port = "${var.egress_from_port}"
#   egress_to_port = "${var.egress_to_port}"
#   egress_protocol = "${var.egress_protocol}"
#   egress_sg_cidr_blocks = "${var.egress_sg_cidr_blocks}"
# }

# module "jenkins_master_sg_extra_rule" {
#   source = "../../aws/ec2/securitygroup/security-rule"  
#   main_rule_cidr_blocks = "${split(",", var.main_rule_cidr_blocks)}"
#   main_rule_type = "${split(",", var.main_rule_type)}"
#   main_rule_to_port = "${split(",",var.main_rule_to_port)}"
#   main_rule_from_port = "${split(",",var.main_rule_from_port)}"
#   main_rule_protocol = "${split(",",var.main_rule_protocol)}"
#   main_rule_security_group_id = "${module.jenkins_master_sg.sg_id}"
# }

# module "jenkins_master_key_pair" {
#   source = "../../aws/ec2/keypair"
#   name = "${var.name}"
#   component = "${var.component}"
#   public_key = "${file("files/public-keys.txt")}"
# }

# module "jenkins_master_iam_profile" {
#   source = "../../aws/iam/service"

#   name = "${var.name}"
#   component = "${var.component}"
#   policy_content = "${file("files/iam-profile-jenkins.json")}"
# }

# module "jenkins_master" {
#   source = "../../aws/ec2/asg"
#   vpc_zone_identifier = ["${module.main_vpc.private_subnet_id}"]
#   availability_zones = ["${var.private_subnets_az}"]

#   asg_min_size = "${var.asg_min}"
#   asg_max_size = "${var.asg_max}"
#   name = "${var.name}"
#   component = "${var.component}"
#   image_id = "${var.image_id}"
#   instance_type =  "${var.instance_type}"
#   iam_instance_profile = "${module.jenkins_master_iam_profile.iam_instance_profile_name}"
#   security_groups = ["${module.jenkins_master_sg.sg_id}"]
#   aws_key_pair_name = "${module.jenkins_master_key_pair.aws_key_pair_name}"
#   user_data = "${file("files/jenkins-userdata.sh")}"
# }

# module "openvpn_sg" {
#   source = "../../aws/ec2/securitygroup"
#   vpc_id = "${element(module.main_vpc.vpc_id, 1)}"
#   name = "${var.name}"
#   component = "${var.openvpn_component}"
#   ingress_from_port = "${var.ingress_from_port}"
#   ingress_to_port = "${var.ingress_to_port}"
#   ingress_protocol = "${var.ingress_protocol}"
#   ingress_sg_cidr_blocks = "${var.ingress_sg_cidr_blocks}"
#   egress_from_port = "${var.egress_from_port}"
#   egress_to_port = "${var.egress_to_port}"
#   egress_protocol = "${var.egress_protocol}"
#   egress_sg_cidr_blocks = "${var.egress_sg_cidr_blocks}"
# }

# # module "openvpn_sg_extra_rule" {
# #   source = "../../aws/ec2/securitygroup/security-rule"  
# #   main_rule_cidr_blocks = "${split(",", var.openvpn_main_rule_cidr_blocks)}"
# #   main_rule_type = "${split(",", var.openvpn_main_rule_type)}"
# #   main_rule_to_port = "${split(",",var.openvpn_main_rule_to_port)}"
# #   main_rule_from_port = "${split(",",var.openvpn_main_rule_from_port)}"
# #   main_rule_protocol = "${split(",",var.openvpn_main_rule_protocol)}"
# #   main_rule_security_group_id = "${module.openvpn_sg.sg_id}"
# # }

# module "openvpn_key_pair" {
#   source = "../../aws/ec2/keypair"
#   component = "${var.openvpn_component}"
#   name = "${var.name}"
#   public_key = "${file("files/public-keys.txt")}"
# }

# module "openvpn_iam_profile" {
#   source = "../../aws/iam/service"
#   name = "${var.name}"
#   component = "${var.openvpn_component}"
#   policy_content = "${file("files/iam-profile-openvpn.json")}"
# }

# module "openvpn" {
#   source = "../../aws/ec2/asg"
#   vpc_zone_identifier = ["${module.main_vpc.public_subnet_id}"]
#   availability_zones = ["${var.public_subnets_az}"]

#   asg_min_size = "${var.openvpn_asg_min}"
#   asg_max_size = "${var.openvpn_asg_max}"
#   name = "${var.name}"
#   component = "${var.openvpn_component}"
#   image_id = "${var.openvpn_image_id}"
#   instance_type =  "${var.openvpn_instance_type}"
#   iam_instance_profile = "${module.openvpn_iam_profile.iam_instance_profile_name}"
#   security_groups = ["${module.openvpn_sg.sg_id}"]
#   aws_key_pair_name = "${module.openvpn_key_pair.aws_key_pair_name}"
#   user_data = "${file("files/openvpn-userdata.sh")}"
#   associate_public_ip_address = "${var.openvpn_associate_public_ip_address}"

# }