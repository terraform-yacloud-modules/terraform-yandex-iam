variable "iam" {
  default = {
    "app" = {
      enabled      = true
      folder_roles = ["editor"]
      cloud_roles  = ["editor"]
    }
  }
}
