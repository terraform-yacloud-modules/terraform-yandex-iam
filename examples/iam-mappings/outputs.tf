output "monitoring_service_account_id" {
  description = "ID созданного сервисного аккаунта для мониторинга"
  value       = yandex_iam_service_account.monitoring_sa.id
}

output "admin_service_account_id" {
  description = "ID созданного сервисного аккаунта для администрирования"
  value       = yandex_iam_service_account.admin_sa.id
}

output "folder_mappings" {
  description = "Назначенные права на уровне folder"
  value       = module.iam_mapping.folder_mapping
}

output "cloud_mappings" {
  description = "Назначенные права на уровне cloud"
  value       = module.iam_mapping.cloud_mapping
}
