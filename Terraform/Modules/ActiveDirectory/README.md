# Module: terraform-aws-ad

## Table of Contents
- [Overview](#overview)
- [Usage](#usage)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Publishing Releases](#publishing-releases)

## <a name="overview">Overview</a>
The AWS Active Directory module provides a Terraform resource for provisioning and managing AWS Directory Service directories configured as AD Connectors. This module simplifies the integration of Active Directory services into your infrastructure on AWS.

Repository: [terraform-aws-ad](https://gitlab.example.ex/example-terraform-enterprise/terraform/modules/terraform-aws-ad)

## <a name="usage">Usage</a>
All variables are required by this Module. Refer to the [examples](./examples) for proper usage.
```hcl
module "example_ad_connector"{
  source  = "terraform.example.ex/example-infrastructure/ad/aws"
  version = "1.0.0"
  # insert required variables here
}
```

## <a name="variables">Variables</a>
| Name | Type | Description | Default |
| - | - | - | - |
| **directoryservice_name** | `string` | (Required) The name of the Active Directory directory. | `null` |
| **ad_password** | `string` | (Required) *Sensitive* - Password for the AD. | `null` |
| **ad_size** | `string` | (Required) The size of the directory (e.g., "Small", "Large"). | `null` |
| **ad_username** | `string` | (Required) The username for the Active Directory. | `null` |
| **vpc_id** | `string` | (Required) The ID of the VPC in which to create the directory. | `null` |
| **subnet_ids** | `list(string)` | (Required) List of subnet IDs in which to create the directory. | `null` |
| **dns_ips** | `list(string)` | (Required) List of custom DNS IP addresses for the directory. | `null` |
| **tag_map** | `map(string)` | (Required) A map of tags to apply to the directory. | `null` |

## <a name="outputs">Outputs</a>
The module provides the following outputs:

| Name | Type | Description |
| - | - | - |
| **directory_id** | `string` | The ID of the Active Directory Connector |

## <a name="publishing-releases">Publishing Releases:</a>
- Open a new Branch, and create a Merge Request
  - Review/test changes
  - Add a new Label to the Merge Request using [Semantic Versioning](https://semver.org/)
- Merge changes into `main` once reviewed and approved
- Until we have a pipeline in place, you'll need to create a new Release after merging into `main`.
  - Go to Project > Releases > New Release

## <a name="changelog">Changelog</a>
See the [Changelog](CHANGELOG.md) for details on notable changes for each Release.
