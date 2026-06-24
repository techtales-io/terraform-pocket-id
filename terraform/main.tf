terraform {
  required_version = ">= 1.10.0, <= 1.15.7"
  required_providers {
    # https://registry.terraform.io/providers/trozz/pocketid/latest/docs
    pocketid = {
      source  = "trozz/pocketid"
      version = "2.1.0"
    }
    # https://registry.terraform.io/providers/hashicorp/vault/latest/docs
    vault = {
      source  = "hashicorp/vault"
      version = "5.10.0"
    }
    # https://registry.terraform.io/providers/carlpett/sops/latest/docs
    sops = {
      source  = "carlpett/sops"
      version = "1.4.1"
    }
  }
}

module "yaml" {
  source = "./modules/data/yaml-loader"
  path   = "${path.root}/../data"
}

module "groups" {
  for_each = module.yaml.data.by_kind["PocketIdGroup"]
  source   = "./modules/pocket-id/group"
  config   = each.value
}

module "clients" {
  for_each = module.yaml.data.by_kind["PocketIdClient"]
  source   = "./modules/pocket-id/client"
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

locals {
  users_data = {
    for f in fileset("${path.root}/../data/users", "*.sops.yaml") :
    replace(f, ".sops.yaml", "") => "${path.root}/../data/users/${f}"
  }
  # extract user groups from group spec.members and then get group id from module.groups[group_name].data.id
  user_groups = {
    for user_name in keys(local.users_data) :
    user_name => sort([
      for group_name, config in module.yaml.data.by_kind["PocketIdGroup"] :
      module.groups[group_name].data.id
      if contains(try(config.spec.members, []), user_name)
    ])
  }
}

data "sops_file" "users" {
  for_each    = local.users_data
  source_file = each.value
}

module "users" {
  for_each = {
    for user_name, data in data.sops_file.users :
    user_name => yamldecode(data.raw)
  }
  source = "./modules/pocket-id/user"
  config = merge(each.value, {
    spec = merge(each.value.spec, {
      groups = local.user_groups[each.key]
    })
  })
}
