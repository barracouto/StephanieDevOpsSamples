# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 01/08/2024

### Added
- Initial release of the AWS Security Group module.
- Implemented the `aws_security_group.aws_sg` resource for creating and managing Security Groups.
- Introduced essential parameters for security group configuration:
  - `sg_name`: Name of the Security Group.
  - `vpc_id`: ID of the VPC in which the Security Group is created.
  - `from_port`: Start of the port range for the ingress rule.
  - `to_port`: End of the port range for the ingress rule.
  - `protocol`: Protocol to apply the rule to (e.g., "tcp", "udp", "icmp").
  - `cidr_blocks`: List of CIDR blocks to allow traffic from/to.
  - `tag_map`: Map of tags to apply to the Security Group.

### Changed
- Updated README with detailed information on usage, inputs, outputs, and examples.

Users can now utilize this module to streamline the creation and management of AWS Security Groups within their infrastructure.