resource "aws_iam_user_group_membership" "main" {
  user   = var.user_iam_name
  groups = var.group_iam_name
}

