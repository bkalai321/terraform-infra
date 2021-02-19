resource "aws_security_group_rule" "main" {
  count = var.count

  type                     = element(var.main_rules, count.index * 5 + 0)
  to_port                  = element(var.main_rules, count.index * 5 + 1)
  from_port                = element(var.main_rules, count.index * 5 + 2)
  source_security_group_id = element(var.main_rules, count.index * 5 + 3)
  protocol                 = element(var.main_rules, count.index * 5 + 4)
  security_group_id        = var.security_group_id
}

