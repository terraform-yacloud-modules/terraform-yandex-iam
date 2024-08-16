output "id" {
  description = "Service account ID"
  value       = module.iam_accounts.id
}

output "name" {
  description = "Service account name"
  value       = module.iam_accounts.name
}

output "api_key_id" {
  description = "Service account API key ID"
  value       = module.iam_accounts.api_key_id
}

output "key_id" {
  description = "Service account key ID"
  value       = module.iam_accounts.key_id
}

output "static_access_key_id" {
  description = "Service account static key ID"
  value       = module.iam_accounts.static_access_key_id
}

output "sak_access_key" {
  description = "Service account static access key"
  value       = module.iam_accounts.sak_access_key
}

output "sak_secret_key" {
  description = "Private part of service account static access key"
  value       = module.iam_accounts.sak_secret_key
  sensitive = true
}

output "sak_encrypted_secret_key" {
  description = "Private (encrypted) part of service account static access key"
  value       = module.iam_accounts.sak_encrypted_secret_key
}

output "sak_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret key"
  value       = module.iam_accounts.sak_key_fingerprint
}
