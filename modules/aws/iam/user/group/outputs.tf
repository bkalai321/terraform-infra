output "id" {
  value = aws_iam_group.main.id
}

output "arn" {
  value = aws_iam_group.main.arn
}

output "group_name" {
  value = aws_iam_group.main.name
}

output "path" {
  value = aws_iam_group.main.path
}

output "unique_id" {
  value = aws_iam_group.main.unique_id
}

output "policy_name" {
  value = aws_iam_group_policy.main.name
}

output "policy" {
  value = aws_iam_group_policy.main.policy
}

