resource "aws_iam_role" "main" {
  name               = "${var.name}-${var.component}-iam-role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.name}-${var.component}-instance-profile-name"
  role = aws_iam_role.main.name
}

resource "aws_iam_role_policy" "main" {
  name   = "${var.name}-${var.component}-role-policy-name"
  role   = aws_iam_role.main.id
  policy = var.policy_content
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "s3.amazonaws.com"]
    }
  }
}

