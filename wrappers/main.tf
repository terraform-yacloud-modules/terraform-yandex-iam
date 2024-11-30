module "wrapper" {
  source = "../modules/iam-account"

  for_each = var.items

  name                      = try(each.value.name, var.defaults.name, null)
  folder_id                 = try(each.value.folder_id, var.defaults.folder_id, null)
  description               = try(each.value.description, var.defaults.description, "")
  cloud_id                  = try(each.value.cloud_id, var.defaults.cloud_id, null)
  folder_roles              = try(each.value.folder_roles, var.defaults.folder_roles, [])
  cloud_roles               = try(each.value.cloud_roles, var.defaults.cloud_roles, [])
  enable_static_access_key  = try(each.value.enable_static_access_key, var.defaults.enable_static_access_key, false)
  static_access_key_pgp_key = try(each.value.static_access_key_pgp_key, var.defaults.static_access_key_pgp_key, null)
  enable_api_key            = try(each.value.enable_api_key, var.defaults.enable_api_key, false)
  api_key_pgp_key           = try(each.value.api_key_pgp_key, var.defaults.api_key_pgp_key, null)
  enable_account_key        = try(each.value.enable_account_key, var.defaults.enable_account_key, false)
  account_key_algorithm     = try(each.value.account_key_algorithm, var.defaults.account_key_algorithm, "RSA_4096")
  account_key_format        = try(each.value.account_key_format, var.defaults.account_key_format, "PEM_FILE")
  account_key_pgp_key       = try(each.value.account_key_pgp_key, var.defaults.account_key_pgp_key, null)
}
