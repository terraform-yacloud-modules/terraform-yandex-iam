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
# keys options
#
variable "enable_static_access_key" {
  description = "If true, static access key will be created"
  type        = bool
  default     = false
}
variable "static_access_key_pgp_key" {
  description = "An optional PGP key to encrypt the resulting private key material"
  type        = string
  default     = null
}

variable "enable_api_key" {
  description = "If true, API key will be created"
  type        = bool
  default     = false
}
variable "api_key_pgp_key" {
  description = "An optional PGP key to encrypt the resulting private key material"
  type        = string
  default     = null
}

variable "enable_account_key" {
  description = "If true, account key key will be created"
  type        = bool
  default     = false
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
