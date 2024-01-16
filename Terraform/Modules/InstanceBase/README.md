# Base Instance Module

# terraform-aws-instance-base

This repository contains Terraform code for managing AWS EC2 instances as a base module.

## Introduction

This Terraform module is designed to provide a common base for AWS EC2 instances, suitable for various applications. It's part of the Serco CMS Terraform Modules.

## Usage

To use this module in your Terraform configurations, you can add the following code:

```hcl
module "aws_instance_base" {
  source = "git::https://gitlab.serco.cms/serco-terraform-enterprise/terraform/modules/terraform-aws-instance-base.git?ref=main"
  version = "1.0.0"

  # Add module input variables here
  instance_type = "t2.micro"
  # ...
}
```

### ABOUT
A "fundamental" module that can be used as base/template for additional EC2 Instance modules.

## Data Types:
- [AWS Caller Identity](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/caller_identity)
- [Subnet](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/subnet)

## Resource Types:
- [EC2 Instance](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/instance)
- [Elastic Network Interface](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/network_interface)
- [EBS Volumes](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/ebs_volume)
  - Dynamically generated
- [EBS Volume Attachments](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/ebs_volume_attachment)
  - Dynamically generated


## Prepare the Module Repository:
- [Preparing the Module Repository](https://developer.hashicorp.com/terraform/cloud-docs/registry/publish-modules#preparing-a-module-repository)


Repository Name: terraform-aws-instance-base
Location: In the Modules Subgroup on GitLab.
Structure: Adhere to the standard Terraform module structure.


## Publish a New Module:
Log in to Terraform Cloud.
Click on "Registry" in the dashboard.
Click "Publish" and select "Module."
Choose the GitLab repository (terraform-aws-instance-base).
Optionally, select the module publishing type (Tag or Branch).
Click "Publish module."