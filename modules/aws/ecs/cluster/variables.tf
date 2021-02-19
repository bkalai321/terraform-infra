variable "name" {
  type        = string
  description = "Cluster Name"
}

variable "component" {
  type        = string
  description = "Component Name"
}

variable "jenkinsUser" {
  type        = string
  description = "Jenkins User who created this cluster"
  default     = "npant"
}

