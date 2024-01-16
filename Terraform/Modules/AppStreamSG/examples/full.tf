module "security_group" {
  source  = "terraform.serco.cms/serco-infrastructure/security-groups/terraform-aws-sg-appstream"
  version = "1.0.0"

  sg_name     = var.sg_name
  vpc_id      = var.vpc_id
  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol
  cidr_blocks = var.cidr_blocks

  tag_map = var.tag_map
}
