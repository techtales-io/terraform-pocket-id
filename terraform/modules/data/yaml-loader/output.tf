output "data" {
  value = {
    by_path        = local.filtered_manifests
    by_kind        = local.by_kind
    by_api_version = local.by_api_version
  }
}
