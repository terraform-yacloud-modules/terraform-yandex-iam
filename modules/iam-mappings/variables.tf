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

Each element describes one group of members:
  name  - arbitrary human-readable group name. The module does not use it: it exists only
          to make the configuration readable, and no resources are created from it.
  users - list of IAM member identifiers: userAccount:<id>, federatedUser:<id>,
          serviceAccount:<id> or group:<id>.
  roles - list of Yandex Cloud roles granted to every member of the group.
For every member x role pair the module creates a separate
yandex_resourcemanager_folder_iam_member, so users and roles are multiplied.
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

Each element describes one group of members:
  name  - arbitrary human-readable group name. The module does not use it: it exists only
          to make the configuration readable, and no resources are created from it.
  users - list of IAM member identifiers: userAccount:<id>, federatedUser:<id>,
          serviceAccount:<id> or group:<id>.
  roles - list of Yandex Cloud roles granted to every member of the group.
For every member x role pair the module creates a separate
yandex_resourcemanager_cloud_iam_member, so users and roles are multiplied.
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
