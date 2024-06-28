module "iam_accounts" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-iam.git//modules/iam-account"

  name      = "test-iam-accounts"
  folder_id = "xxx"
  folder_roles = [
    "editor",
    "container-registry.images.puller",
    "k8s.tunnelClusters.agent"
  ]
  cloud_roles              = []
  enable_static_access_key = false
  enable_api_key           = false
  enable_account_key       = false

}
