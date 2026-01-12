terraform {
  required_version = ">= 1.9.0, <= 1.14.3"
  required_providers {
    # https://registry.terraform.io/providers/aminueza/minio/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "0.1.7"
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
  allowed_user_groups       = var.config.spec.groups != null ? var.config.spec.groups : []
}
