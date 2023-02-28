output "cloud_mapping" {
  description = "Cloud IAM mappings"
  value       = local.cloud_mappings
}

output "folder_mapping" {
  description = "Folder IAM mappings"
  value       = local.folder_mappings
}
