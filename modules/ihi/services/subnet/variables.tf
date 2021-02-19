variable "name" {
  description = "name of subnet"
}

variable "private_az" {
  description = "Private availability zone"
  type = list(string)
}

variable "octet_bit"{ 
  description = "VPC CIDR Octet bit"
  default = "8"
}

variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "subnet_third_octet" {
  description = "Third octet of subnet"
}

variable "subnet_component" {
  description = "subnet component can be private or public"
  default = "private"
}

variable "all_public_ip_cidr" {
  description = "All public IP CIDR value"
  default = "0.0.0.0/0"
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
}

variable "last_octet" {
  description = "Last octet bit"
  default = "30"
}