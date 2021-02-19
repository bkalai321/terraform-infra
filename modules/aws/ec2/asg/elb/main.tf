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
  force_delete              = true
  load_balancers            = var.load_balancers
  default_cooldown          = var.health_check_default_cooldown

  lifecycle {
    create_before_destroy = false
  }
  tags = [
    {
      key                 = "Name"
      value               = "${var.name}-${var.component}"
      propagate_at_launch = true
    },
    {
      key                 = "ihi-name"
      value               = var.name
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
  ]
}

# resource "aws_autoscaling_schedule" "main" {
#   count = "${var.create_scheduler > 0 ? 1:0}"

#   scheduled_action_name = "${var.name}-${var.component}-asg-shutdown-schedule"
#   min_size              = "${var.asg_min_size}"
#   max_size              = "${var.asg_max_size}"
#   desired_capacity      = "${var.asg_min_size}"
#   start_time             = "${var.start_time}"
#   end_time               = "${var.shutdown_time}"
#   autoscaling_group_name = "${aws_autoscaling_group.main.name}"
# }

resource "aws_launch_configuration" "main" {
  name                        = "${var.name}-${var.component}-${var.myVersion}-lc"
  image_id                    = var.image_id
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile
  security_groups             = var.security_groups
  key_name                    = var.aws_key_pair_name
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size           = "100"
    volume_type           = "io1"
    iops                  = "5000"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

