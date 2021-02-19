######### module vpc variables
variable "aws_region" {
  default = "us-east-1"
}

variable "peer_owner_id" { 
  default = "460093719278" 
}

variable "peer_vpc_id" {
  type = "string"
  description = "Peer VPC ID. normally IHI-MAIN VPC"
  default = "vpc-0b4752c9ffbcbc68a"
}

variable "vpc_id" {
  type = "string"
  description = "VPC ID where peering is instanciated"
  default = "vpc-0af6fc33a2761e810"
}

variable "peer_name" {
  type = "string"
  default = "ihi_main"
}

variable "auto_accept_peering" {
  type = "string"
  description = "auto accept peering or not"
  default = "true"
}

variable "name" { 
  default = "thirdparty-ihi-main"
}

variable "destination_cidr_block" {
  type = "list"
  default = ["10.201.0.0/16"]
}

variable "private_az" {
  type = "list"
  default = ["us-east-1c", "us-east-1b"]
}

variable "public_az" {
  type = "list"
  default = ["us-east-1c"]
}

variable "nat_route_table_id" {
  type = "list"
  default = ["rtb-07b68781dc51167df","rtb-046dd4f0ce2b6abc1"]
}
variable "internet_route_table_id" {
  type = "list"
  default = ["rtb-0cedc59c28d7eb5d9"]
}

