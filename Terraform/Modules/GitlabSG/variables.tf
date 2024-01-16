variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "name_prefix" {
  type        = string
  description = "Name Prefix"
}

variable "description" {
  type        = string
  description = "The description for the AWS Security Group"
  default     = "Defer granular inbound access controls to GitLab"
}

# CIDR Block Rules
variable "ingress_ssh_cidrs" {
  description = "CIDR blocks for ingress SSH access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_https_cidrs" {
  description = "CIDR blocks for ingress HTTPS access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_collector_cidrs" {
  description = "CIDR blocks for ingress heavy event collector/app packages and config access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_all" {
  description = "CIDR blocks for primary egress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
