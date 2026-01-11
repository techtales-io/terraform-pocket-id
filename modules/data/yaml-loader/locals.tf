locals {
  # Read all YAML files from the specified folder
  raw_manifests = {
    for file_path in fileset(var.path, "**/*.yaml") :
    file_path => yamldecode(file("${var.path}/${file_path}"))
  }

  # Filter valid manifests (must have apiVersion, kind, metadata with name, and spec)
  valid_manifests = {
    for file_path, manifest in local.raw_manifests :
    file_path => manifest
    if try(manifest.apiVersion, null) != null &&
    try(manifest.kind, null) != null &&
    try(manifest.metadata.name, null) != null &&
    try(manifest.spec, null) != null
  }

  # Apply filtering based on provided criteria
  filtered_manifests = {
    for file_path, manifest in local.valid_manifests :
    file_path => manifest
    if(
      # Check api_version filter (empty list means match all)
      (length(var.filter.api_version) == 0 || contains(var.filter.api_version, manifest.apiVersion)) &&
      # Check kind filter (empty list means match all)
      (length(var.filter.kind) == 0 || contains(var.filter.kind, manifest.kind)) &&
      # Check namespace filter (empty list means match all)
      (length(var.filter.namespace) == 0 || contains(var.filter.namespace, try(manifest.metadata.namespace, "")))
    )
  }

  # Group by kind (using namespace/name as key, fallback to name only)
  by_kind = {
    for kind in distinct([for manifest in local.filtered_manifests : manifest.kind]) :
    kind => {
      for file_path, manifest in local.filtered_manifests :
      try(manifest.metadata.namespace, null) != null ?
      "${manifest.metadata.namespace}/${manifest.metadata.name}" :
      manifest.metadata.name => manifest
      if manifest.kind == kind
    }
  }

  # Group by api_version
  by_api_version = {
    for api_version in distinct([for manifest in local.filtered_manifests : manifest.apiVersion]) :
    api_version => {
      for file_path, manifest in local.filtered_manifests :
      file_path => manifest
      if manifest.apiVersion == api_version
    }
  }
}
