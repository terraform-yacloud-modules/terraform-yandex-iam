variable "iam" {
  type = map(object({
    enabled      = bool
    folder_roles = list(string)
    cloud_roles  = list(string)
  }))
  description = "IAM configuration for service accounts"
  default = {
    "app" = {
      enabled      = true
      folder_roles = ["editor"]
      cloud_roles  = ["editor"]
    }
  }
}
