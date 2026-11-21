data "yandex_client_config" "client" {}

provider "yandex" {
}

locals {
  sa_name = "test-iam-accounts"
}

# Сервисный аккаунт, которому выдана роль на основном (запуск ресурсов от его имени, ключи, impersonate).
resource "yandex_iam_service_account" "sa_user" {
  name        = "${local.sa_name}-user"
  description = "Сервисный аккаунт с правом использовать основной SA"
  folder_id   = coalesce(var.folder_id, data.yandex_client_config.client.folder_id)
}

resource "yandex_lockbox_secret" "sa_static_key" {
  name        = "sa-static-access-key-${local.sa_name}"
  description = "Static access key for service account"
  folder_id   = coalesce(var.folder_id, data.yandex_client_config.client.folder_id)
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
  enable_api_key           = true
  enable_account_key       = false

  api_key_scopes = ["yc.ydb.topics.manage", "yc.ydb.tables.manage"]

  # Кто может использовать этот сервисный аккаунт (запуск ресурсов от его имени, ключи, impersonate).
  service_account_iam_members = [
    {
      role   = "iam.serviceAccounts.user"
      member = "serviceAccount:${yandex_iam_service_account.sa_user.id}"
    }
  ]

  static_access_key_output_to_lockbox = {
    secret_id            = yandex_lockbox_secret.sa_static_key.id
    entry_for_access_key = "static_access_key_id"
    entry_for_secret_key = "static_access_key_secret"
  }

  # OIDC workload identity federation: внешние системы (например, GitHub Actions)
  # получают IAM-токен сервисного аккаунта без статического ключа.
  workload_identity_federation = {
    name        = "${local.sa_name}-github-oidc"
    description = "GitHub Actions OIDC federation for ${local.sa_name}"
    issuer      = "https://token.actions.githubusercontent.com"
    jwks_url    = "https://token.actions.githubusercontent.com/.well-known/jwks"
    audiences   = ["https://github.com/terraform-yacloud-modules"]
    labels = {
      managed-by = "terraform"
      issuer     = "github-actions"
    }
  }

  workload_identity_subjects = [
    "repo:terraform-yacloud-modules/terraform-yandex-iam:ref:refs/heads/main",
    "repo:terraform-yacloud-modules/terraform-yandex-iam:pull_request",
  ]

  timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
