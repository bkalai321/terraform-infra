resource "aws_instance" "main" {
  ami                    = var.ami
  key_name               = var.key_pair
  subnet_id              = var.subnet_id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  vpc_security_group_ids = [var.security_groups]
  iam_instance_profile   = var.iam_instance_profile
  private_ip             = var.private_ip_address

  user_data = var.user_data

  tags = {
    Name      = "${var.name}-${var.component}-ec2-instance"
    Component = var.component
    build_url = var.build_url
  }
}

