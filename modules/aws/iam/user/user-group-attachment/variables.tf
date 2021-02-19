variable "user_iam_name" {
  type        = string
  description = "Username in the IAM"
}

variable "group_iam_name" {
  type        = list(string)
  description = "Group Name in IAM"
}

