resource "aws_security_group_rule" "egress_all" {
  description       = "Egress to anywhere"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.egress_all
  security_group_id = aws_security_group.this.id
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
}