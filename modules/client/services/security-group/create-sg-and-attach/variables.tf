variable "aws_region" {default = "us-east-1"}
variable "name" {default = "ihi-main"}
variable "component" {default = "new-sg"}
variable "vpc_id" {}
variable "jenkinsUser" {default = "null"}
variable "source_port" {default = "0"}
variable "destination_port" {default = "0"}
variable "cidr" {}
variable "protocol" {default = "-1"}
variable "security_group_id" {}