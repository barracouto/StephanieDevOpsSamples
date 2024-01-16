module "ad_connector" {
  source  = "terraform.example.ex/example-infrastructure/ad/aws"
  version = "1.0.0"

  directoryservice_name = "example-ad-directory"
  vpc_id          = "vpc-12345678"
  subnet_ids      = ["subnet-1234567891011", "subnet-1110987654321"]
  dns_ips         = ["10.0.0.1", "10.0.0.2"]

  ad_size         = "Small"
  ad_username     = "admin"
  ad_password     = "your_password"
}
