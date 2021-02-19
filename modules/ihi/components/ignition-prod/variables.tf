#-----snapshot
variable "db_instance_identifier" {
  default     = "ignition-core"
  description = "db instance identifier name"
}

#-----RDS
variable "instance_class" {
  description = "instance type"
  default     = "db.t2.xlarge"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "name" {
  description = "DB name"
  default     = "ignitiontest"
}

variable "allocated_storage" {
  description = "allocated storage"
  default     = "50"
}

variable "engine" {
  description = "engine"
  default     = "mysql"
}

variable "engine_version" {
  description = "engine version"
  default     = "5.7.23"
}

variable "skip_final_snapshot" {
  description = "skip final snapshot"
  default     = true
}

variable "username" {
  description = "username"
  default     = "admin"
}

variable "password" {
  description = "password"
  default     = "password"
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
  default     = "default-sg"
}

variable "parameter_group_name" {
  description = "parameter group name"
  default     = "default.mysql5.7"
}

variable "type-deployment" {
  default = "type of deployment"
}

variable "component" {
  default = "component"
}

variable "name_identifier" {
  description = " identifier name"
  default     = "ignition-core-ohio"
}

# #route53
# variable "zone_id"{
#   default = "Z1BVTKTRJERAM0"
# }
#
# variable "domain_name" { default = "jira-stagedb"}
#
# variable "hosted_domain_name" {
#   default = "aws.ihies.com"
# }
#
# variable "type" {
#   default = "CNAME"
# }
#
# variable "ttl" { default = "3600"}
#
# #variable "record_value" {
# #  default = "${module.jiradb.address}"
# #}
