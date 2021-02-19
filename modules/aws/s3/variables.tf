variable "bucket_name" {
}

variable "bucket_acl" {
  default = "private"
}

variable "server_side_encryption_algorithm" {
  default = "AES256"
}

variable "kms_key_id" {
  default = ""
}

variable "s3_versioning_enabled" {
  default = false
}

variable "bucket_region" {
}

