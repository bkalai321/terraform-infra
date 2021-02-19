variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-0b4752c9ffbcbc68a"
}
variable "vpc_peering_connection_id" {
  description = "VPC peering connection id"
}
variable "cidr_block" {
  description = "cidr block for peering"
}
variable "name" {
  default = "ihi-main"
}
variable "component" {
  default = "peering-route"
}