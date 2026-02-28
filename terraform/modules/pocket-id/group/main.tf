terraform {
  required_version = ">= 1.10.0, <= 1.14.6"
  required_providers {
    # https://registry.terraform.io/providers/aminueza/minio/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "0.1.7"
    }
  }
}

resource "pocketid_group" "main" {
  # required fields
  name          = var.config.metadata.name
  friendly_name = coalesce(var.config.spec.friendlyName, var.config.metadata.name)
}
