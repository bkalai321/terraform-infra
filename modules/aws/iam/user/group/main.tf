resource "aws_iam_group" "main" {
  name = "${var.component}-group"
  path = "/${var.component}/"
}

resource "aws_iam_group_policy" "main" {
  name   = "${var.name}-${var.component}-iam-role-policy"
  group  = aws_iam_group.main.id
  policy = var.policy
}

