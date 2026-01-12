terraform {
  required_version = ">= 1.9.0, <= 1.14.3"
  required_providers {
    # https://registry.terraform.io/providers/aminueza/minio/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "0.1.7"
    }
    # https://registry.terraform.io/providers/hashicorp/vault/latest/docs
    vault = {
      source  = "hashicorp/vault"
      version = "5.6.0"
    }
  }
}

module "yaml" {
  source = "../modules/data/yaml-loader"
  path   = "${path.root}/../data"
}

module "groups" {
  for_each = module.yaml.data.by_kind["PocketIDGroup"]
  source   = "../modules/pocket-id/group"
  config   = each.value
}

module "clients" {
  for_each = module.yaml.data.by_kind["PocketIDClient"]
  source   = "../modules/pocket-id/client"
  # translate the group names to IDs
  config = merge(each.value, {
    spec = merge(each.value.spec, {
      groups = try(each.value.spec.groups, null) != null ? [
        for group_name in each.value.spec.groups :
        module.groups[group_name].data.id
      ] : null
    })
  })
}
