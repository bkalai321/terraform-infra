data "template_file" "policyDocument" {
  template = var.filePath
}

resource "aws_iam_user_policy" "policy" {
  name = var.policyName
  user = var.userName

  policy = data.template_file.policyDocument.rendered
}

