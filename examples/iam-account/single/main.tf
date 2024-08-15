module "iam_accounts" {
  source = "../../../modules/iam-account"

  name = "test-iam-accounts"
  folder_roles = [
    "editor",
    "container-registry.images.puller",
    "k8s.tunnelClusters.agent"
  ]
  cloud_roles              = []
  enable_static_access_key = true
  enable_api_key           = false
  enable_account_key       = false

}
