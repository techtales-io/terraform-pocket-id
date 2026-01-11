provider "vault" {
  # ATLANTIS_INJECT_VAULT_CONFIG
}

data "vault_generic_secret" "provider_config" {
  path = "infra/techtales/terraform-pocket-id"
}

provider "pocketid" {
  base_url  = data.vault_generic_secret.provider_config.data["base_url"]
  api_token = data.vault_generic_secret.provider_config.data["api_token"]
}
