module "iam_accounts" {
  for_each = {
    for k, v in var.iam : k => v if v["enabled"]
  }

  source = "../../../modules/iam-account"

  name         = format("testprefix-%s", each.key)
  folder_roles = each.value["folder_roles"]
#   cloud_roles  = each.value["cloud_roles"]
}
