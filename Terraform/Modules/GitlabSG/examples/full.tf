module "gitlab-sg" {
  source  = "terraform.serco.cms/serco-infrastructure/sg-gitlab/aws"
  version = "1.0.0"

  vpc_id                  = var.vpc_id
  name_prefix             = var.name_prefix
  ingress_ssh_cidrs       = var.ingress_ssh_cidrs
  ingress_https_cidrs     = var.ingress_https_cidrs
  ingress_collector_cidrs = var.ingress_collector_cidrs
  egress_all              = var.egress_all
}
