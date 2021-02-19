variable "aws_region" {}
variable "name" {}
variable "component" {}
variable "policy_filename" {
  default = "files/iam-group-policy.json}"
}
variable "bucket_name" { default = ""}
variable "bucket_region" { default = "us-east-1" }