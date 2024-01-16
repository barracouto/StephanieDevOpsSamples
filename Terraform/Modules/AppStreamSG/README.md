# Module: terraform-aws-sg-appstream

## Table of Contents
- [Overview](#overview)
- [Usage](#usage)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Publishing Releases](#publishing-releases)
- [Changelog](#changelog)

## <a name="overview">Overview</a>
The AWS Appstream Security Group module provides a Terraform resource for creating and managing an AWS Security Group for Appstream. This module simplifies the configuration of security group rules for inbound and outbound traffic within a specified Virtual Private Cloud (VPC).

Repository: [terraform-aws-sg-appstream](http://gitlab.serco.cms/serco-terraform-enterprise/terraform/modules/security-groups/terraform-aws-sg-appstream.git)

## <a name="usage">Usage</a>
All variables are required by this Module. Refer to the [examples](./examples) for proper usage.
```hcl
module "aws_sg"{
  source      = "serco-terraform-enterprise/security-groups/terraform-aws-sg-appstream"
  version     = "1.0.0"
  sg_name     = "example-appstream-sg"
  vpc_id      = "vpc-12345678"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  tag_map     = var.tag_map
}
```
###### All values can and should be set as variables
## <a name="variables">Variables</a>
| Name                  | Type          | Description                                              | Default  |
|-----------------------|---------------|----------------------------------------------------------|----------|
| **region**            | `string`      | The AWS region to deploy resources in.                    | us-east-1|
| **sg_name**           | `string`      | **(Required)** The name of the Security Group.            | `null`   |
| **vpc_id**            | `string`      | **(Required)** The ID of the VPC in which to create the Security Group. | `null` |
| **from_port**         | `number`      | **(Required)** The start of the port range for the ingress rule. | `null` |
| **to_port**           | `number`      | **(Required)** The end of the port range for the ingress rule.   | `null` |
| **protocol**          | `string`      | **(Required)** The protocol to apply the rule to (e.g., "tcp", "udp", "icmp"). | `null` |
| **cidr_blocks**       | `list(string)`| **(Required)** List of CIDR blocks to allow traffic from/to.| `null` |
| **tag_map**           | `map(string)` | **(Required)** A map of tags to apply to the Security Group. | `null` |
| **description**       | `string`      | The description for the AWS Security Group               |AWS Security Group|

For more details on inputs and additional configuration options, refer to the [Terraform AWS Security Group documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group).

## <a name="outputs">Outputs</a>
The module provides the following outputs:

| Name               | Type     | Description                                       |
|-------------------|----------|---------------------------------------------------|
| **security_group_id** | `string` | The ID of the created Security Group.            |

## <a name="publishing-releases">Publishing Releases:</a>
- Open a new Branch, and create a Merge Request
  - Review/test changes
  - Add a new Label to the Merge Request using [Semantic Versioning](https://semver.org/)
- Merge changes into `main` once reviewed and approved
- Until we have a pipeline in place, you'll need to create a new Release after merging into `main`.
  - Go to Project > Releases > New Release

## <a name="changelog">Changelog</a>
See the [Changelog](CHANGELOG.md) for details on notable changes for each Release.