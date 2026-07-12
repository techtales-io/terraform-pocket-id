<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

# TF DOCS

<!-- markdownlint-disable -->
<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0, <= 1.15.7 |
| <a name="requirement_pocketid"></a> [pocketid](#requirement\_pocketid) | 2.1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 5.10.1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_pocketid"></a> [pocketid](#provider\_pocketid) | 2.1.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.10.1 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [pocketid_client.main](https://registry.terraform.io/providers/trozz/pocketid/2.1.0/docs/resources/client) | resource |
| [vault_kv_secret_v2.main](https://registry.terraform.io/providers/hashicorp/vault/5.10.1/docs/resources/kv_secret_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_config"></a> [config](#input\_config) | n/a | <pre>object({<br/>    apiVersion = string<br/>    kind       = string<br/>    metadata = object({<br/>      name      = string<br/>      namespace = optional(string)<br/>    })<br/>    spec = object({<br/>      callbackUrls       = optional(list(string))<br/>      logoutCallbackUrls = optional(list(string))<br/>      public             = optional(bool)<br/>      pkce               = optional(bool)<br/>      launchUrl          = optional(string)<br/>      reauthenticate     = optional(bool)<br/>      groups             = optional(list(string))<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_data"></a> [data](#output\_data) | n/a |
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
<!-- markdownlint-enable -->
