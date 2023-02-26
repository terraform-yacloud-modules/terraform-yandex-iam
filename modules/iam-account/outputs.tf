output "id" {
  value = yandex_iam_service_account.main.id
}

output "name" {
  value = yandex_iam_service_account.main.name
}

output "api_key_id" {
  value = var.enable_api_key ? yandex_iam_service_account_api_key.main[0].id : null
}

output "key_id" {
  value = var.enable_account_key ? yandex_iam_service_account_key.main[0].id : null
}

output "static_access_key_id" {
  value = var.enable_static_access_key ? yandex_iam_service_account_static_access_key.main[0].id : null
}
