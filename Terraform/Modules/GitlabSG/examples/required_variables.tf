module "gitlab-sg" {
  source  = "terraform.serco.cms/serco-infrastructure/sg-gitlab/aws"
  version = "1.0.0"

  vpc_id                  = "vpc-0123456789abcdef0"
  name_prefix             = "serco-environment-example"
}
