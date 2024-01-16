# Required
variable "name" {
  description = "Name for the Instance and associated resources."
  type        = string
}

variable "iam_instance_profile" {
  type        = string
  description = "The IAM Instance Profile to associate with the EC2 Instance."
}

# Optional
variable "ami_id" {
  type        = string
  description = "The AMI ID used for the EC2 Instance."
  default     = ""
}

variable "ami_details" {
  type        = any
  description = "A Map of attributes to use for searching for AMI IDs to use for your EC2 Instance."
  default     = {}
}

variable "instance_type" {
  type        = string
  description = "The Instance Type used for the EC2 Instance."
  default     = "t3.medium"
}

variable "key_pair_name" {
  type        = string
  description = "The Name of the Key Pair used for accessing the EC2 Instance."
}

variable "kms_key_id" {
  type        = string
  description = "The KMS Key for encrypting Block Device resources."
  default     = null
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS Optimized instances."
  default     = true
}

variable "private_ips" {
  type        = list(string)
  description = "Private IPs to assign to the Interface."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "The Subnet ID where the ENI will be generated.  Also used to collect AZ information for EBS Volumes."
}

variable "security_groups" {
  type        = list(string)
  description = "A list of Security Group IDs to attach to the ENI."
}

variable "restore_from_snapshot" {
  description = "Should the module build the instance from a snapshot?"
  default     = false
  type        = bool
}

variable "restore_snapshot_id" {
  description = "The Snapshot ID used to build/restore the EC2 Instance"
  type        = string
  default     = null
}

variable "root_block_device_settings" {
  type    = any
  default = {}
}

variable "external_device_settings" {
  type    = any
  default = {}
}

variable "metadata_option_settings" {
  type    = any
  default = {}
}

variable "enable_instance_protection" {
  default = false
  type    = bool
}

variable "enable_source_dest_check" {
  type    = bool
  default = "false"
}

variable "enable_aws_backups" {
  default     = false
  type        = bool
  description = "Assigns AWS Backup Tags to the Instance for scheduled snapshots."
}

variable "aws_backup_tag_map" {
  default = {}
  type    = any
}

variable "user_data" {
  type        = string
  description = " User data to provide when launching the instance. Do not pass gzip-compressed data via this argument"
  default     = null
}

variable "user_data_base64" {
  type        = string
  description = " User data to provide when launching the instance. Do not pass gzip-compressed data via this argument"
  default     = null
}

variable "custom_tags" {
  type    = any
  default = {}
}

variable "lifecycle_settings" {
  type    = any
  default = {}
}
