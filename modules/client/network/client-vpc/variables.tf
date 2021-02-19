variable "hosted_domain_new_vpc_id" { 
  description = "VPC id from ihi-main"
  default = "vpc-0b4752c9ffbcbc68a"
}
######### module vpc variables
variable "component" {
  default = "default"
}
variable "aws_region" {
  default = "us-east-1"
}
variable "name" {
  default = "ihi-main"
}
variable "vpc_cidr_block" {
  default = "10.222.0.0/16"
}
variable "environment" {
  default = "ihi-main"
}
######### module subnet variables
variable "private_az" {
  type = "list"
  default = ["us-east-1e", "us-east-1a"]
}

variable "public_az" {
  type = "list"
  default = ["us-east-1f"]
}

variable "office_vpn" {
  default = "18.209.77.206/32"
}

####### module network acl variables
variable "office_ip_cidr" { default = "99.43.125.145/32"}
variable "all_public_ip_cidr" { default = "0.0.0.0/0" }
variable "old_office_vpc_cidr" { default = "10.40.0.0/16"}


### New Variables
variable "hosted_domain_name" {
  type = "string"
  default = "client.ihies.com"
}


