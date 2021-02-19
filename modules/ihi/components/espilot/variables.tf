variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0b4752c9ffbcbc68a"
}

variable "name" {
  default = "ihi-main"
}

variable "component" {
}

variable "image_id" {
  default = "ami-04d1df6f2ba74afa5"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "subnet_id" {
  default = "subnet-06ca68ca73e662d57"
}

variable "instance_type" {
  default = "m5a.large"
}

variable "user_data" {
  default = "files/pilot-userdata.sh"
}

variable "jenkinsUser" {
}

variable "hosted_zone_id" {
  default = "Z1BVTKTRJERAM0"
}

variable "domain_name" {
  default = "pilot-docker"
}

variable "hosted_domain_name" {
  default = "aws.ihies.com"
}

variable "hostname" {
  default = "decs"
}

variable "build_url" {
}

variable "folderPath" {
}

variable "versionNumber" {
}

variable "terminateInHrs" {
}

