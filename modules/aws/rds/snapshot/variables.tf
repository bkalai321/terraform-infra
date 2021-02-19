variable "db_instance_identifier" {
  type        = string
  description = "db instance identifier name"
  #default     = "jiradb-restore"
}

variable "db_snapshot_identifier" {
  type        = string
  description = "db snapshot identifier name"
  #default     = "jiradb-restore"
}

variable "count_snap" {
}

