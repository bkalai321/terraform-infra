variable "instance_class" {
  description = "instance type"
}

variable "name" {
  description = "DB name"
}

variable "snapshot_identifier" {
  description = "snapshot identifier"
}

variable "allocated_storage" {
  description = "allocated storage"
}

variable "engine" {
  description = "engine"
  default     = "mysql"
}

variable "engine_version" {
  description = "engine version"
}

variable "skip_final_snapshot" {
  description = "skip final snapshot"
  default     = true
}

variable "username" {
  description = "username"
  default     = "root"
}

variable "password" {
  description = "password"
  default     = "Heavy.1027"
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
}

variable "parameter_group_name" {
  description = "parameter group name"
}

variable "type-deployment" {
  description = "type of deployment"
  default     = "staging"
}

variable "component" {
  default = "deployment"
}

variable "name_identifier" {
  description = " identifier name"
}
