resource "aws_security_group_rule" "main" {
  count = length(var.main_rules) / 5 > 0 ? length(var.main_rules) / 5 : 0

  type              = element(var.main_rules, count.index * 5 + 0)
  to_port           = element(var.main_rules, count.index * 5 + 1)
  from_port         = element(var.main_rules, count.index * 5 + 2)
  cidr_blocks       = split(":", element(var.main_rules, count.index * 5 + 3))
  protocol          = element(var.main_rules, count.index * 5 + 4)
  security_group_id = var.security_group_id
}

