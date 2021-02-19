resource "aws_instance" "main" {
  ami                     = var.ami
  subnet_id               = var.subnet_id
  instance_type           = var.instance_type
  availability_zone       = var.availability_zone
  vpc_security_group_ids  = var.security_groups
  iam_instance_profile    = var.iam_instance_profile
  user_data               = var.user_data
  disable_api_termination = var.disable_api_termination

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = "true"
  }

  tags = {
    Name           = "${var.name}-${var.component}-ec2-instance"
    ihi-name       = var.name
    User           = var.jenkinsUser
    Component      = var.component
    Build_Url      = var.build_url
    folderPath     = var.folderPath
    terminate      = var.terminate
    versionNumber  = var.versionNumber
    terminateInHrs = var.terminateInHrs
  }
}

