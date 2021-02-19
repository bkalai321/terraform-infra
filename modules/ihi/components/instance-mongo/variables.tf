variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0b4752c9ffbcbc68a"
}

variable "name" {
  default = "MongoDB"
}

variable "component" {
  default = "mongo"
}

variable "image_id" {
  default = "ami-04b9e92b5572fa0d1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "subnet_id" {
  default = "subnet-06ca68ca73e662d57"
}

variable "instance_type" {
  default = "t3a.medium"
}

variable "user_data" {
  default = "files/create-instance-base-userdata.sh"
}

variable "jenkinsUser" {
}

variable "folderPath" {
}

variable "build_url" {
}

variable "volume_size" {
  default = 50
}

variable "key_pair" {
  default = "ihies-east-1"
}

variable "terminateInHrs" {
  default = 9
}

