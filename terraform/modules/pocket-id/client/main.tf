terraform {
  required_version = ">= 1.10.0, <= 1.14.6"
  required_providers {
    # https://registry.terraform.io/providers/aminueza/minio/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "0.1.7"
    }
    # https://registry.terraform.io/providers/hashicorp/vault/latest/docs
    vault = {
      source  = "hashicorp/vault"
      version = "5.7.0"
    }
  }
}

resource "pocketid_client" "main" {
  # required fields
  name                      = var.config.metadata.name
  callback_urls             = var.config.spec.callbackUrls != null ? var.config.spec.callbackUrls : []
  logout_callback_urls      = var.config.spec.logoutCallbackUrls != null ? var.config.spec.logoutCallbackUrls : null
  is_public                 = var.config.spec.public == null ? false : var.config.spec.public
  pkce_enabled              = var.config.spec.pkce == null ? false : var.config.spec.pkce
  launch_url                = var.config.spec.launchUrl
  requires_reauthentication = var.config.spec.reauthenticate == null ? false : var.config.spec.reauthenticate
  allowed_user_groups       = var.config.spec.groups != null ? sort(var.config.spec.groups) : null

  # │ Warning: Redundant ignore_changes element
  # │
  # │   on modules/pocket-id/client/main.tf line 17, in resource "pocketid_client" "main":
  # │   17: resource "pocketid_client" "main" {
  # │
  # │ Adding an attribute name to ignore_changes tells Terraform to ignore future
  # │ changes to the argument in configuration after the object has been created,
  # │ retaining the value originally configured.
  # │
  # │ The attribute has_logo is decided by the provider alone and therefore there
  # │ can be no configured value to compare with. Including this attribute in
  # │ ignore_changes has no effect. Remove the attribute from ignore_changes to
  # │ quiet this warning.

  #   lifecycle {
  #     ignore_changes = [
  #       has_logo,
  #     ]
  #   }
}

resource "vault_generic_secret" "main" {
  path = "infra/pocketid/clients/${pocketid_client.main.name}"

  data_json = jsonencode({
    "CLIENT_ID"     = pocketid_client.main.id
    "CLIENT_SECRET" = pocketid_client.main.client_secret
  })
}
