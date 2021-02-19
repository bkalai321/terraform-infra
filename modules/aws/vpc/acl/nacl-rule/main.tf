resource "aws_network_acl_rule" "main" {
  count = length(var.acl_rules) / 7 > 0 ? length(var.acl_rules) / 7 : 0

  network_acl_id = var.network_acl_id
  egress         = var.egress

  protocol    = element(var.acl_rules, count.index * 7 + 0)
  rule_number = element(var.acl_rules, count.index * 7 + 1)
  rule_action = element(var.acl_rules, count.index * 7 + 2)
  cidr_block  = element(var.acl_rules, count.index * 7 + 3)
  from_port   = element(var.acl_rules, count.index * 7 + 4)
  to_port     = element(var.acl_rules, count.index * 7 + 5)
}

