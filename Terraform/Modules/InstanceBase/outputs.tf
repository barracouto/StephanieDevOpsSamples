output "instance" {
  value = aws_instance.this
}

output "interface" {
  value = aws_network_interface.this
}

output "volumes" {
  value = {
    root = aws_instance.this.root_block_device.0
    ebs  = aws_ebs_volume.this[*]
  }
}