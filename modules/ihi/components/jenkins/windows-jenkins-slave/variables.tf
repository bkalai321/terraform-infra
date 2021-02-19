variable "aws_region" {default = "us-east-1"}
variable "vpc_id" { default = "vpc-7b9f4b00" }
variable "name" { default = "stephen-docker" }
variable "component" {default = "pilot"}

variable "image_id" {default = "ami-0ac019f4fcb7cb7e6"}

variable "availability_zone" {default = "us-east-1a"}
variable "subnet_id" {default = "subnet-dbfaa286"}
variable "instance_type" { default = "m4.large"}
variable "myVersion" { default = "1.0"}
variable "s3_terraform_bucket" { default = "ihi-main-terraform-us-east-1"}
variable "user_data" {default = "files/create-windows-slave-userdata.sh" }
variable "jenkinsUser" {}
variable "folderPath" {}
variable "build_url" {}
variable "volume_size" {default = 50}
