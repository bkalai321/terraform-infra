resource "aws_iam_user" "main" {
  name          = var.user_name
  path          = "/${var.user_name}/"
  force_destroy = "true"
}

resource "aws_iam_user_policy" "main" {
  name   = "${var.user_name}-policy"
  user   = aws_iam_user.main.id
  policy = var.policy
}

