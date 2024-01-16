data "aws_caller_identity" "this" {}
/*
data "aws_ami" "this" {
  count = var.ami_id == "" || var.ami_id == null ? 0 : 1

  owners      = try(var.ami_details.owners, null)
  most_recent = try(var.ami_details.most_recent, true)
  name_regex  = try(var.ami_details.name_regex, null)

  dynamic "filter" {
    for_each = try(var.ami_details.filter_map, {})
    content {
      name   = each.key
      values = each.value
    }
  }
}
*/

data "aws_subnet" "this" {
  id = var.subnet_id
}

locals {
  ami_to_use = var.ami_id #== "" || var.ami_id == null ? data.aws_ami.this[0].id : var.ami_id

  rest_snap       = var.restore_from_snapshot
  backups_enabled = var.enable_aws_backups ? "TRUE" : "FALSE"
  backup_tag_map = merge(
    { AwsBackup = local.backups_enabled },
    var.aws_backup_tag_map
  )
}
