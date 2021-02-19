output "sg_id" {
  value = module.sg.id
}

output "sg_name" {
  value = module.sg.sg_name
}

output "sg_arn" {
  value = module.sg.sg_arn
}

output "iam_instance_role_arn" {
  description = "Iam Arn created"
  value       = module.iam_instance_profile.iam_arn
}

output "iam_instance_role_name" {
  description = "Iam Name created"
  value       = module.iam_instance_profile.iam_name
}

output "iam_instance_profile_arn" {
  description = "Profile Arn created"
  value       = module.iam_instance_profile.iam_instance_profile_arn
}

output "iam_instance_profile_name" {
  description = "Profile Name"
  value       = module.iam_instance_profile.iam_instance_profile_name
}

