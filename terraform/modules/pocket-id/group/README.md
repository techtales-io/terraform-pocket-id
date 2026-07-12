<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

# TF DOCS

<!-- markdownlint-disable -->
<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0, <= 1.15.8 |
| <a name="requirement_pocketid"></a> [pocketid](#requirement\_pocketid) | 2.1.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_pocketid"></a> [pocketid](#provider\_pocketid) | 2.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [pocketid_group.main](https://registry.terraform.io/providers/trozz/pocketid/2.1.0/docs/resources/group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_config"></a> [config](#input\_config) | n/a | <pre>object({<br/>    apiVersion = string<br/>    kind       = string<br/>    metadata = object({<br/>      name      = string<br/>      namespace = optional(string)<br/>    })<br/>    spec = object({<br/>      friendlyName = optional(string)<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_data"></a> [data](#output\_data) | n/a |
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
<!-- markdownlint-enable -->
