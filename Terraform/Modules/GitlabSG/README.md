# Module: terraform-aws-gitlab-sg

## Table of Contents
- [Overview](#overview)
- [Usage](#usage)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Publishing Releases](#publishing-releases)
- [Changelog](#changelog)

## <a name="overview">Overview</a>
The AWS GitLab Security Group module provides a Terraform resource for creating and managing an AWS Security Group tailored for GitLab. This module facilitates the configuration of granular inbound access controls to GitLab within a specified Virtual Private Cloud (VPC).

Repository: [terraform-aws-gitlab-sg](https://gitlab.serco.cms/serco-terraform-enterprise/terraform/modules/security-groups/terraform-aws-sg-gitlab)

## <a name="usage">Usage</a>
All variables are required by this module. Refer to the [examples](./examples) for proper usage.
```hcl
module "gitlab_sg"{
  source             = "terraform.serco.cms/serco-infrastructure/sg-gitlab/aws"
  version            = "1.0.0"
  vpc_id             = "vpc-12345678"
  name_prefix        = "example"
  ingress_ssh_cidrs  = ["0.0.0.0/0"]
  ingress_https_cidrs = ["0.0.0.0/0"]
  ingress_collector_cidrs = ["0.0.0.0/0"]
  egress_all         = ["0.0.0.0/0"]
}
```
<br>

| Name                 | Type              | Description                                                      | Default |
|----------------------|-------------------|------------------------------------------------------------------|--------|
| **vpc_id**           | `string`          | **(Required)** VPC ID for the Security Group.                    | `null`  |
| **name_prefix**      | `string`          | **(Required)** Name Prefix for resources.                         | `null` |
| **description**      | `string`          | The description for the AWS Security Group.                      | "Defer granular inbound access controls to GitLab" |
| **ingress_ssh_cidrs**      | `list(string)`          | CIDR blocks for ingress SSH access.                      | `["0.0.0.0/0"]`|
| **ingress_https_cidrs**      | `list(string)`          | CIDR blocks for ingress HTTPS access.                    | `["0.0.0.0/0"]`|
| **ingress_collector_cidrs** | `list(string)`          | CIDR blocks for ingress heavy event collector/app packages and config access. | `["0.0.0.0/0"]` |
| **egress_all**              | `list(string)`          | CIDR blocks for primary egress rule.                         | `["0.0.0.0/0"]` |

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