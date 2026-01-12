variable "config" {
  type = object({
    apiVersion = string
    kind       = string
    metadata = object({
      name      = string
      namespace = optional(string)
    })
    spec = object({
      callbackUrls       = optional(list(string))
      logoutCallbackUrls = optional(list(string))
      public             = optional(bool)
      pkce               = optional(bool)
      launchUrl          = optional(string)
      reauthenticate     = optional(bool)
      groups             = optional(list(string))
    })
  })

  validation {
    condition     = var.config.apiVersion == "terraform.techtales.io/v1alpha1"
    error_message = "The api must be `terraform.techtales.io` in version `v1alpha1`."
  }

  validation {
    condition     = var.config.kind == "PocketIDClient"
    error_message = "The kind must be 'PocketIDClient'."
  }

  validation {
    condition     = can(regex("^[a-z0-9-.]+$", var.config.metadata.name)) && var.config.metadata.name != ""
    error_message = "The metadata.name must be a non-empty string."
  }
}
