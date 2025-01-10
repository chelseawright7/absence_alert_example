# Mezmo Pipeline Export

Export of your Mezmo pipeline to Terraform.

## Table of Contents
1. [Quick start](#quick-start)
2. [File Layout](#file-layout)
3. [Additional online resources](#additional-online-resources)
4. How do I...
   1. [Add credentials](#add-credentials)
   2. [Create additional pipelines](#create-additional-pipelines)
   3. [Clone to another account](#clone-to-another-account)
   4. [Import terraform state]()

## Quick start

To view the changes that would be applied to your pipeline if applied:
```shell
terraform plan
```

To apply the changes to your pipeline account:
```shell
terraform apply
```

## File layout

The folder structure for your pipelines will always be of the format:

* main.tf
* sources.tf
* processors.tf
* destinations.tf
* variables.tf
* import-resource-state.sh

The following files also appear in your export project as a simple way to set sensitive field values. A `.gitignore` file has been generated that ignores all tfvars files to avoid committing sensitive values. You can also remove these files, provided the sensitive variables are set through another means. 

* sources.auto.tfvars
* processors.auto.tfvars
* destinations.auto.tfvars

## Additional online resources

* [https://docs.mezmo.com](https://docs.mezmo.com) - for more details regarding using Terraform with Mezmo and pipelines
* [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs) - for information about using Terraform
* [https://developer.hashicorp.com/terraform/language](https://developer.hashicorp.com/terraform/language) - for information around Terraform syntax and how to write Terraform files

## How do I...

### Add credentials

All configured values for sensitive fields, e.g. credentials, have been omitted from the exported files. We have instead declared variables for each field and output placeholder values in the `<component>.auto.tfvars` files., where `<component>` will be either `sources`, `processors` or `destinations`. You will need to supply values for each variable before you can apply the Terraform project.

These values should be considered sensitive and not committed to source control. You can also remove these files, provided the sensitive variables are set through another means.

### Create additional pipelines

Creating a new pipeline can be done by adding a new pipeline resource into the `main.tf` file and then building out additional subresources for the new pipeline.

### Clone to another account

Terraform resources are created under the account associated with the API token. To create resources under a different account using Terraform, you will need to create an API key under the target account and replace the `api_key` variable value to match this new key.

### Import terraform state

The `terraform-provider-mezmo` supports importing existing state for pipeline resources. A shell script, `import-resource-state.sh`, was added to the project. This script calls `terraform import` for every resource that was in the pipeline at the time of export. Any resources added or removed after export will not be part of this import script unless added when the resources are changed.