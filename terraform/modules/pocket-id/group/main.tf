terraform {
  required_version = ">= 1.10.0, <= 1.16.0"
  required_providers {
    # https://registry.terraform.io/providers/trozz/pocketid/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "2.3.0"
    }
  }
}

resource "pocketid_group" "main" {
  # required fields
  name          = var.config.metadata.name
  friendly_name = coalesce(var.config.spec.friendlyName, var.config.metadata.name)
}
