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

  # Каждый элемент списка — группа участников:
  # name  — произвольная метка для читаемости, модуль её не использует;
  # users — IAM-идентификаторы участников (serviceAccount:<id>, userAccount:<id>, ...);
  # roles — роли, которые получает каждый участник группы.
  folder_mappings = [
    {
      name  = "monitoring"
      users = ["serviceAccount:${yandex_iam_service_account.monitoring_sa.id}"]
      roles = ["viewer", "monitoring.viewer"]
    }
  ]

  # Роли на уровне облака; cloud_id по умолчанию берётся из конфигурации провайдера.
  cloud_mappings = [
    {
      name  = "admin"
      users = ["serviceAccount:${yandex_iam_service_account.admin_sa.id}"]
      roles = ["admin", "editor"]
    }
  ]
}
