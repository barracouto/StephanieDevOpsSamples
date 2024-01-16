resource "aws_instance" "this" {
  ami                  = local.ami_to_use
  ebs_optimized        = var.ebs_optimized
  key_name             = var.key_pair_name
  iam_instance_profile = var.iam_instance_profile
  instance_type        = var.instance_type

  user_data        = try(var.user_data, null)
  user_data_base64 = try(var.user_data_base64, null)

  metadata_options {
    http_endpoint               = try(var.metadata_option_settings.http_endpoint, "enabled")
    http_tokens                 = try(var.metadata_option_settings.http_tokens, "optional")
    http_put_response_hop_limit = try(var.metadata_option_settings.http_put_response_hop_limit, 1)
    instance_metadata_tags      = try(var.metadata_option_settings.instance_metadata_tags, null)
  }

  network_interface {
    delete_on_termination = false
    network_interface_id  = aws_network_interface.this.id
    device_index          = 0
  }

  root_block_device {
    delete_on_termination = try(var.root_block_device_settings.delete_on_termination, true)

    encrypted  = try(var.root_block_device_settings.encrypted, true)
    kms_key_id = try(var.kms_key_id, null)

    volume_size = try(var.root_block_device_settings.size, null)
    volume_type = try(var.root_block_device_settings.type, "gp2")
    iops        = try(var.root_block_device_settings.iops, null)
    throughput  = try(var.root_block_device_settings.type, "gp2") == "gp3" ? try(var.root_block_device_settings.throughput, 125) : null
    tags = merge(
      var.custom_tags,
      {
        AttachedTo = var.name
        Name       = "${var.name}-root"
        VolumeType = try(upper(var.root_block_device_settings.type), "GP2")
      }
    )
  }

  lifecycle {
    ignore_changes = [launch_template, user_data, user_data_base64]
  }

  tags = merge(
    var.custom_tags,
    {
      Name = var.name
    }
  )
}

resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  private_ips       = try(var.private_ips, null)
  security_groups   = var.security_groups
  source_dest_check = try(var.enable_source_dest_check, false)
  tags = merge(
    var.custom_tags,
    {
      AttachedTo = var.name
      Name       = "${var.name}-eni"
    }
  )
}


resource "aws_ebs_volume" "this" {
  for_each = var.external_device_settings

  availability_zone = data.aws_subnet.this.availability_zone
  encrypted         = try(each.value.encrypted, true)
  kms_key_id        = try(var.kms_key_id, null)
  iops              = try(each.value.iops, null)
  size              = try(each.value.size, null)
  type              = try(each.value.type, "gp2")
  throughput        = try(each.value.type, "gp2") == "gp3" ? try(each.value.throughput, 125) : null

  tags = merge(
    var.custom_tags,
    {
      AttachedTo       = aws_instance.this.tags_all.Name
      AvailabilityZone = data.aws_subnet.this.availability_zone
      Name             = "${var.name}-${each.key}"
      VolumeType       = try(upper(each.value.type), "GP2")
    },
    try(each.value.tags, {})
  )
}

resource "aws_volume_attachment" "this" {
  for_each    = var.external_device_settings
  device_name = each.key
  volume_id   = aws_ebs_volume.this[each.key].id
  instance_id = aws_instance.this.id
}
