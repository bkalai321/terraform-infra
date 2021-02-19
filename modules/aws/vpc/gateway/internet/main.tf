resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  count  = length(var.availability_zones) > 0 ? 1 : 0
  tags = {
    Name        = "${var.name}-internet-gateway"
    Environment = var.environment
  }
}

