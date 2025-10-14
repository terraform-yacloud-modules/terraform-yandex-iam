module "iam_mapping" {
  source = "../../modules/iam-mappings"

  folder_mappings = [
    {
      name  = "monitoring"
      users = ["serviceAccount:ajeifmb86k9j28sui2fk"]
      roles = ["viewer"]
    }
  ]

  cloud_mappings = [
    {
      name  = "qa"
      users = ["userAccount:ajeifmb8621j28sui2fk"]
      roles = ["admin"]
    }
  ]

  timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

}
