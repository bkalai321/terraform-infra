resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = var.image_id
  instance_type = var.instance_type

  availability_zone    = var.availability_zone
  key_name             = var.key_pair_name
  user_data            = var.user_data
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name      = "${var.name}-ec2-instance"
    Build_url = var.build_url
  }
}

