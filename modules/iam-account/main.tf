data "yandex_client_config" "client" {}

locals {
  folder_id = var.folder_id == null ? data.yandex_client_config.client.folder_id : var.folder_id
  cloud_id  = var.cloud_id == null ? data.yandex_client_config.client.cloud_id : var.cloud_id
}

resource "yandex_iam_service_account" "main" {
  name        = var.name
  description = var.description
  folder_id   = local.folder_id

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = try(timeouts.value.create, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }

}

# relationship between folder, service account, role
resource "yandex_resourcemanager_folder_iam_member" "main" {
  for_each = length(var.folder_roles) > 0 ? toset(var.folder_roles) : []

  folder_id = local.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.main.id}"
  role      = each.value

}

# relationship between cloud, service account, role
resource "yandex_resourcemanager_cloud_iam_member" "main" {
  for_each = length(var.cloud_roles) > 0 ? toset(var.cloud_roles) : []

  cloud_id = local.cloud_id
  member   = "serviceAccount:${yandex_iam_service_account.main.id}"
  role     = each.value

}

# Роли на самом сервисном аккаунте (кто может им пользоваться, например iam.serviceAccounts.user)
resource "yandex_iam_service_account_iam_member" "main" {
  for_each = length(var.service_account_iam_members) > 0 ? {
    for idx, m in var.service_account_iam_members : "${idx}-${m.member}-${m.role}" => m
  } : {}

  service_account_id = yandex_iam_service_account.main.id
  role               = each.value.role
  member             = each.value.member
}
