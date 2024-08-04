output "id" {
  description = "Service account ID"
  value       = module.iam_accounts.id
}

output "name" {
  description = "Service account name"
  value       = module.iam_accounts.name
}
