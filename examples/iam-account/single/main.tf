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

  # Новые параметры для интеграции с Lockbox
  # static_access_key_output_to_lockbox = {
  #   secret_id = "e4q2b8a3b1c2d3e4f5g6h7i8j9k0l1m"
  #   key       = "static_access_key"
  # }

  timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

}
