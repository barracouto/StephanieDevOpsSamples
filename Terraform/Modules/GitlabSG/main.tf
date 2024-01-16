resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-gitlab-sg"
  vpc_id      = var.vpc_id
  description = var.description

  tags = {
    Name = "${var.name_prefix}-gitlab-sg"
  }
}