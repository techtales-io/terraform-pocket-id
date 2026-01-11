variable "path" {
  description = "Path to the folder containing YAML files"
  type        = string
}

variable "filter" {
  description = "Filter criteria for YAML manifests"
  type = object({
    api_version = optional(list(string), [])
    kind        = optional(list(string), [])
    namespace   = optional(list(string), [])
  })
  default = {
    api_version = []
    kind        = []
    namespace   = []
  }
}
