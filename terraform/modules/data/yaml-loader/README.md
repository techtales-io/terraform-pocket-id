<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->
<!-- markdownlint-disable MD060 -->

# TF DOCS

<!-- prettier-ignore-start -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0, <= 1.14.3 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | Path to the folder containing YAML files | `string` | n/a | yes |
| <a name="input_filter"></a> [filter](#input\_filter) | Filter criteria for YAML manifests | <pre>object({<br/>    api_version = optional(list(string), [])<br/>    kind        = optional(list(string), [])<br/>    namespace   = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "api_version": [],<br/>  "kind": [],<br/>  "namespace": []<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data"></a> [data](#output\_data) | n/a |
<!-- END_TF_DOCS -->

<!-- prettier-ignore-end -->
