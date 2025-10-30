# Создание сервисных аккаунтов с генерацией ID через Terraform
resource "yandex_iam_service_account" "monitoring_sa" {
  name        = "monitoring-service-account"
  description = "Monitoring service account for folder permissions"
}

resource "yandex_iam_service_account" "admin_sa" {
  name        = "admin-service-account"
  description = "Admin service account for cloud permissions"
}

module "iam_mapping" {
  source = "../../modules/iam-mappings"

  folder_mappings = [
    {
      name  = "monitoring"
      users = ["serviceAccount:${yandex_iam_service_account.monitoring_sa.id}"]
      roles = ["viewer", "monitoring.viewer"]
    }
  ]

  cloud_mappings = [
    {
      name  = "admin"
      users = ["serviceAccount:${yandex_iam_service_account.admin_sa.id}"]
      roles = ["admin", "editor"]
    }
  ]
}
