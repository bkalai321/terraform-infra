resource "aws_eip" "main" {
  vpc                       = var.use_vpc
  instance                  = var.instance_id
  associate_with_private_ip = var.private_ip

  tags = {
    Name = "${var.name}-${var.component}-eip"
    Component = var.component
    Environment = var.environment
  }
}

