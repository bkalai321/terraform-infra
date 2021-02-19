resource "aws_key_pair" "my_key" {
  key_name   = "${var.name}-${var.component}-sshkey"
  public_key = var.public_key
}

