resource "aws_security_group_rule" "ingress_ssh" {
  description       = "SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.ingress_ssh_cidrs
  security_group_id = aws_security_group.this.id
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
}
resource "aws_security_group_rule" "ingress_https" {
  description       = "HTTPS"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.ingress_https_cidrs
  security_group_id = aws_security_group.this.id
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
}
resource "aws_security_group_rule" "ingress_collector" {
  description       = "Heavy event collector/app packages and config from master"
  type              = "ingress"
  from_port         = 8089
  to_port           = 8089
  protocol          = "tcp"
  cidr_blocks       = var.ingress_collector_cidrs
  security_group_id = aws_security_group.this.id
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
}
