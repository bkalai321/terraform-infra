resource "aws_ecs_cluster" "main" {
  name = var.name

  tags = {
    Name = "${var.name}-${var.component}-ecs-cluster"
    User = var.jenkinsUser
  }
}

