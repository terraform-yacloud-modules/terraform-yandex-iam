output "id" {
  description = "Service account ID"
  value       = yandex_iam_service_account.main.id
}

output "name" {
  description = "Service account name"
  value       = yandex_iam_service_account.main.name
}

output "api_key_id" {
  description = "Service account API key ID"
  value       = var.enable_api_key ? yandex_iam_service_account_api_key.main[0].id : null
}

output "key_id" {
  description = "Service account key ID"
  value       = var.enable_account_key ? yandex_iam_service_account_key.main[0].id : null
}

output "static_access_key_id" {
  description = "Service account static key ID"
  value       = var.enable_static_access_key ? yandex_iam_service_account_static_access_key.main[0].id : null
}

output "sak_access_key" {
  description = "Service account static access key"
  value       = var.enable_static_access_key ? yandex_iam_service_account_static_access_key.main[0].access_key : null
}

output "sak_secret_key" {
  description = "Private part of service account static access key"
  value       = var.enable_static_access_key ? yandex_iam_service_account_static_access_key.main[0].secret_key : null
}

output "sak_encrypted_secret_key" {
  description = "Private (encrypted) part of service account static access key"
  value       = var.enable_static_access_key && var.static_access_key_pgp_key != null ? yandex_iam_service_account_static_access_key.main[0].encrypted_secret_key : null
}

output "sak_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret key"
  value       = var.enable_static_access_key && var.static_access_key_pgp_key != null ? yandex_iam_service_account_static_access_key.main[0].key_fingerprint : null
}
