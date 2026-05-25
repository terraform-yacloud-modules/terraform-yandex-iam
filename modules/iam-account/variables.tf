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
# naming
#
variable "name" {
  description = "Service account name"
  type        = string
}

variable "description" {
  description = "Service account description"
  type        = string
  default     = ""
}

#
# IAM roles
#
variable "folder_roles" {
  description = "A list of roles that will be attached to in folder scope"
  type        = list(string)
  default     = []
}
variable "cloud_roles" {
  description = "A list of roles that will be attached to in cloud scope"
  type        = list(string)
  default     = []
}

#
# IAM members on the service account (who can use this SA)
#
variable "service_account_iam_members" {
  description = "List of { role, member } to grant roles on this service account (e.g. iam.serviceAccounts.user). Member format: userAccount:id, serviceAccount:id, federatedUser:id, system:group:id"
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}

#
# static key options
#
variable "enable_static_access_key" {
  description = "If true, static access key will be created"
  type        = bool
  default     = false
}
variable "static_access_key_description" {
  description = "The static access key description"
  type        = string
  default     = ""
}
variable "static_access_key_pgp_key" {
  description = "An optional PGP key to encrypt the resulting private key material"
  type        = string
  default     = null
}
variable "static_access_key_output_to_lockbox" {
  description = "Configuration for storing static access key in Yandex Lockbox secret"
  type = object({
    secret_id            = string
    entry_for_access_key = string
    entry_for_secret_key = string
  })
  default = null
}

#
# api key options
#
variable "enable_api_key" {
  description = "If true, API key will be created"
  type        = bool
  default     = false
}
variable "api_key_description" {
  description = "The api key description"
  type        = string
  default     = ""
}
variable "api_key_pgp_key" {
  description = "An optional PGP key to encrypt the resulting private key material"
  type        = string
  default     = null
}
variable "api_key_expires_at" {
  description = "The key will be no longer valid after expiration timestamp. Example: 2024-11-11T00:00:00Z"
  type        = string
  default     = null
}
variable "api_key_scopes" {
  description = "The list of scopes of the key."
  type        = list(string)
  default     = []
}
variable "api_key_output_to_lockbox" {
  description = "Configuration for storing API key in Yandex Lockbox secret"
  type = object({
    secret_id = string
    key       = string
  })
  default = null
}

#
# account key options
#
variable "enable_account_key" {
  description = "If true, account key key will be created"
  type        = bool
  default     = false
}
variable "account_key_description" {
  description = "The account key description"
  type        = string
  default     = ""
}
variable "account_key_algorithm" {
  description = "The algorithm used to generate the key"
  type        = string
  default     = "RSA_4096"
}
variable "account_key_format" {
  description = "The output format of the keys"
  type        = string
  default     = "PEM_FILE"
}
variable "account_key_pgp_key" {
  description = "An optional PGP key to encrypt the resulting private key material"
  type        = string
  default     = null
}
variable "account_key_output_to_lockbox" {
  description = "Configuration for storing account key in Yandex Lockbox secret"
  type = object({
    secret_id             = string
    entry_for_private_key = string
  })
  default = null
}

variable "timeouts" {
  description = "Timeout settings for cluster operations"
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
