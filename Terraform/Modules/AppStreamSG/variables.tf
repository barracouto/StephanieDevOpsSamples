variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region to deploy resources in."
}

variable "sg_name" {
  type        = string
  description = "(Required) The name of the Security Group."
}

variable "description" {
  type        = string
  description = "The description for the AWS Security Group"
  default     = "AWS Security Group"
}

variable "vpc_id" {
  type        = string
  description = "(Required) The ID of the VPC in which to create the Security Group."
}

variable "from_port" {
  type        = number
  description = "(Required) The start of the port range for the ingress rule."
}

variable "to_port" {
  type        = number
  description = "(Required) The end of the port range for the ingress rule."
}

variable "protocol" {
  type        = string
  description = "(Required) The protocol to apply the rule to (e.g., 'tcp', 'udp', 'icmp')."
}

variable "cidr_blocks" {
  type        = list(string)
  description = "(Required) List of CIDR blocks to allow traffic from/to."
}

