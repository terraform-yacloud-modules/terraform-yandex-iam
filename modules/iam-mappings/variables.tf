#
# yandex cloud coordinates
#
variable "cloud_id" {
  type        = string
  default     = null
  description = "Cloud-ID where where need to add permissions. If omitted default CLOUD_ID will be used"
}

variable "folder_id" {
  description = "Folder-ID where need to add permissions. If omitted default FOLDER_ID will be used"
  type        = string
  default     = null
}

#
# mappings
#
variable "folder_mappings" {
  description = <<EOT
Group of IAM User-IDs and it's permissions in FOLDER
### Example
#folder_mappings = [
  {
    name  = "devops"
    users = ["userAccount:idxxxxxx1", "federatedUser:idxxxxxx2"]
    roles = ["iam.serviceAccounts.user", "k8s.editor", "k8s.cluster-api.cluster-admin", "container-registry.admin"]
  },
  {
    name  = "developers"
    users = ["userAccount:idxxxxxx3"]
    roles = ["k8s.viewer"]
  }
]
EOT
  type        = any
  default     = []
}

variable "cloud_mappings" {
  description = <<EOT
Group of IAM User-IDs and it's permissions in CLOUD
### Example
#cloud_mappings = [
  {
    name  = "sre"
    users = ["userAccount:idxxxxxx1", "federatedUser:idxxxxxx2"]
    roles = ["editor", ]
  },
  {
    name  = "qa"
    users = ["userAccount:idxxxxxx3"]
    roles = ["viewer"]
  }
 ]
EOT
  type        = any
  default     = []
}
