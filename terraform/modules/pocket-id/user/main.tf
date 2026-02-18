terraform {
  required_version = ">= 1.10.0, <= 1.14.5"
  required_providers {
    # https://registry.terraform.io/providers/aminueza/minio/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "0.1.7"
    }
  }
}

resource "pocketid_user" "main" {
  username     = var.config.metadata.name
  display_name = try(var.config.spec.displayName, var.config.metadata.name)
  email        = try(var.config.spec.email, "")
  first_name   = try(var.config.spec.firstName, "")
  last_name    = try(var.config.spec.lastName, "")
  disabled     = try(var.config.spec.disabled, false)
  is_admin     = try(var.config.spec.isAdmin, false)
  groups       = try(var.config.spec.groups, [])
}
