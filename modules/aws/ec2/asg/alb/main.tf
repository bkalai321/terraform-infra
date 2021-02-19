resource "aws_autoscaling_group" "main" {
  name                 = "${var.name}-${var.component}-asg"
  max_size             = var.asg_max_size
  min_size             = var.asg_min_size
  desired_capacity     = var.asg_min_size
  launch_configuration = aws_launch_configuration.main.name
  availability_zones   = var.availability_zones
  vpc_zone_identifier  = var.vpc_zone_identifier

  health_check_type         = "ELB"
  health_check_grace_period = var.health_check_grace_period
  default_cooldown          = var.health_check_default_cooldown

  force_delete      = true
  target_group_arns = var.alb_target_group_arns

  lifecycle {
    create_before_destroy = true
  }

  tags = [
    {
      key                 = "Name"
      value               = "${var.name}-${var.component}"
      propagate_at_launch = true
    },
    {
      key                 = "Component"
      value               = var.component
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "Version"
      value               = var.myVersion
      propagate_at_launch = true
    },
    {
      key                 = "ihi-name"
      value               = var.name
      propagate_at_launch = true
    },
  ]
}

resource "aws_autoscaling_schedule" "main" {
  count = var.create_scheduler > 0 ? 1 : 0

  scheduled_action_name  = "${var.name}-${var.component}-asg-shutdown-schedule"
  min_size               = var.asg_min_size
  max_size               = var.asg_max_size
  desired_capacity       = var.asg_min_size
  start_time             = var.start_time
  end_time               = var.shutdown_time
  autoscaling_group_name = aws_autoscaling_group.main.name
}

resource "aws_launch_configuration" "main" {
  name                        = "${var.name}-${var.component}-${var.myVersion}-lc"
  image_id                    = var.image_id
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile
  security_groups             = var.security_groups
  key_name                    = var.aws_key_pair_name
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address

  dynamic "ebs_block_device" {
    for_each = [var.ebs_block_device]
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      no_device             = lookup(ebs_block_device.value, "no_device", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }
  dynamic "root_block_device" {
    for_each = [var.root_block_device]
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

