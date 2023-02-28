data "yandex_client_config" "client" {}

locals {
  folder_id = var.folder_id == null ? data.yandex_client_config.client.folder_id : var.folder_id
  cloud_id  = var.cloud_id == null ? data.yandex_client_config.client.cloud_id : var.cloud_id

  folder_mappings = chunklist(flatten([for v in var.folder_mappings : setproduct(v.users, v.roles)]), 2)
  cloud_mappings  = chunklist(flatten([for v in var.cloud_mappings : setproduct(v.users, v.roles)]), 2)
}


# relationship between folder, service account, role
resource "yandex_resourcemanager_folder_iam_member" "main" {
  count = length(local.folder_mappings)

  folder_id = local.folder_id

  member = element(local.folder_mappings, count.index)[0]
  role   = element(local.folder_mappings, count.index)[1]
}

# relationship between cloud, service account, role
resource "yandex_resourcemanager_cloud_iam_member" "main" {
  count = length(local.cloud_mappings)

  cloud_id = local.cloud_id

  member = element(local.cloud_mappings, count.index)[0]
  role   = element(local.cloud_mappings, count.index)[1]
}
