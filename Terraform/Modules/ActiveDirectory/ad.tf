# AD Connector
resource "aws_directory_service_directory" "ad_connector" {
  name     = var.directoryservice_name
  password = var.ad_password
  size     = title(var.ad_size)
  type     = "ADConnector"

  connect_settings {
    vpc_id            = var.vpc_id
    subnet_ids        = var.subnet_ids
    customer_dns_ips  = var.dns_ips
    customer_username = var.ad_username
  }

  tags = {
    Name = var.directoryservice_name
  }
}
