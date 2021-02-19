######### module vpc variables
variable "aws_region" {
  default = "us-east-1"
}

variable "name" {
  default = "ihi-main"
}

variable "vpc_cidr_block" {
  default = "10.201.0.0/16"
}

variable "environment" {
  default = "ihi-main"
}

######### module subnet variables
variable "private_az" {
  default = ["us-east-1e", "us-east-1a"]
}

variable "public_az" {
  default = ["us-east-1f"]
}

variable "office_vpn" {
  default = "18.209.77.206/32"
}

####### module network acl variables
variable "office_ip_cidr" {
  default = "99.43.125.145/32"
}

variable "all_public_ip_cidr" {
  default = ["0.0.0.0/0"]
}

variable "old_office_vpc_cidr" {
  default = ["10.40.0.0/16"]
}

variable "old_vpc_id" {
  default = "vpc-7b9f4b00"
}

# Might need to do for subnet allocation later in the future, so saving it. 
// http://blog.itsjustcode.net/blog/2017/11/18/terraform-cidrsubnet-deconstructed/
# variable subnet_allocation_map {
#   description = "Map of CIDR blocks to carve into subnets based on size"
#   type = map
#   defautl = {
#     xsmall = "10.201.0.0/20"
#     small  = "10.201.144.0/20"
#     medium = "10.201.160.0/20"
#     large  = "10.201.176.0/20"
#    }
# }
# variable "newbit_size" {
#   description = "Map the friendly name to our subnet bit mask"
#   type        = "map"
#   default = {
#     xsmall = "6"
#     small  = "5"
#     medium = "4"
#     large  = "3"
#   }
# }
