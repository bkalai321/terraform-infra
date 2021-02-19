output "iam_arn" {
  description = "Iam Arn created"
  value       = aws_iam_role.main.arn
}

output "iam_name" {
  description = "Iam Name created"
  value       = aws_iam_role.main.name
}

output "iam_instance_profile_id" {
  description = "Iam Instance Profile Id"
  value       = aws_iam_instance_profile.main.id
}

output "iam_instance_profile_name" {
  description = "Iam Instance Profile Name"
  value       = aws_iam_instance_profile.main.name
}

output "iam_instance_profile_arn" {
  description = "Iam Instance Profile arn"
  value       = aws_iam_instance_profile.main.arn
}

output "iam_instance_role_policy" {
  description = "Iam Instance Role Policy"
  value       = aws_iam_role_policy.main.policy
}

output "iam_instance_role_id" {
  description = "Iam Instance Role Id"
  value       = aws_iam_role_policy.main.id
}

