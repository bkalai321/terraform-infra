variable "name" {
  description = "Name of the stack"
}

variable "component" {
}

variable "asg_max_size" {
  description = "Autoscaling group Max instance size"
}

variable "asg_min_size" {
  description = "Autoscaling group Min instances to be deployed"
}

variable "image_id" {
  description = "AMI for instance to launch"
}

variable "instance_type" {
  description = "Instance Type to launch"
}

variable "iam_instance_profile" {
  description = "Instance Profile to be attached"
  default     = ""
}

variable "security_groups" {
  type        = list(string)
  description = "Security groups to be attached to the instance"
}

variable "aws_key_pair_name" {
  description = "AWS Keypair name to be given to the instance to login"
}

variable "user_data" {
  description = "Base64 encoded file user data"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "vpc zone subnet ids"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZ where instances will be launched"
}

variable "environment" {
  type        = string
  description = "Environment Name"
  default     = "dev"
}

variable "associate_public_ip_address" {
  default     = "false"
  description = "associate public ip address or not. Needs true for public subnet only"
}

variable "myVersion" {
  description = "default version number for updating lc"
}

variable "start_time" {
  description = "when instances needs to be started"
  default     = "2014-06-01T00:00:00Z"
}

variable "shutdown_time" {
  description = "when instances needs to be shut down"
  default     = "2014-06-01T00:05:00Z"
}

variable "create_scheduler" {
  description = "Create scheduler or not"
  default     = "0"
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance"
  type        = list(string)
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = []
}

variable "snapshot_id" {
  description = "If you want to use snapshot ID to create ebs, then put value otherwise it should be empty"
  default     = "0"
}

variable "alb_target_group_arns" {
  description = "ALB target group arns"
  type        = list(string)
}

variable "health_check_default_cooldown" {
  default = "400"
}

variable "health_check_grace_period" {
  default = "300"
}

