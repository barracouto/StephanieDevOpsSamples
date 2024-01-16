variable "directoryservice_name" {
  type        = string
  description = "The name of the Active Directory Connector."
}

variable "ad_password" {
  type        = string
  description = "Password for the AD. Set as SENSITIVE variable in TFE"
  sensitive   = true
}

variable "ad_username" {
  type        = string
  description = "The username for the Active Directory."
}

variable "ad_size" {
  type        = string
  description = "The size of the directory (e.g., \"Small\", \"Large\")."
  validation {
    condition = length(regexall("^(large|Large|small|Small)", var.ad_size)) > 0
    error_message = <<MESSAGE
  The "ad_size" variable accepts one of the following values (capitalized or not):
  * "Small", "small"
  * "Large", "large"
MESSAGE
  }
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which to create the directory."  
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs in which to create the directory."
}

variable "dns_ips" {
  type        = list(string)
  description = "List of custom DNS IP addresses for the directory."
}
