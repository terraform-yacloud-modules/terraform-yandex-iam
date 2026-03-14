data "yandex_client_config" "client" {}

locals {
  sa_name = "test-iam-accounts"
}

# Сервисный аккаунт, которому выдана роль на основном (запуск ресурсов от его имени, ключи, impersonate).
resource "yandex_iam_service_account" "sa_user" {
  name        = "${local.sa_name}-user"
  description = "Сервисный аккаунт с правом использовать основной SA"
  folder_id   = data.yandex_client_config.client.folder_id
}

resource "yandex_lockbox_secret" "sa_static_key" {
  name        = "sa-static-access-key-${local.sa_name}"
  description = "Static access key for service account"
  folder_id   = data.yandex_client_config.client.folder_id
}

module "iam_accounts" {
  source = "../../../modules/iam-account"

  name = local.sa_name
  folder_roles = [
    "editor",
    "container-registry.images.puller",
    "k8s.tunnelClusters.agent"
  ]
  cloud_roles              = []
  enable_static_access_key = true
  enable_api_key           = false
  enable_account_key       = false

  # Кто может использовать этот сервисный аккаунт (запуск ресурсов от его имени, ключи, impersonate).
  service_account_iam_members = [
    {
      role   = "iam.serviceAccounts.user"
      member = "serviceAccount:${yandex_iam_service_account.sa_user.id}"
    }
  ]

  static_access_key_output_to_lockbox = {
    secret_id = yandex_lockbox_secret.sa_static_key.id
    key       = "static_access_key"
  }

  timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
