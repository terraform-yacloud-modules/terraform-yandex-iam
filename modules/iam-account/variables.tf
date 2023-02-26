#
# yandex cloud coordinates
#
variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
}

#
# naming
#
variable "name" {
  description = "IAM SA name"
  type        = string
}

variable "description" {
  description = "IAM SA description"
  type        = string
  default     = ""
}

variable "labels" {
  description = "A set of labels"
  type        = map(string)
  default     = {}
}

#
# IAM options
#
variable "enable_static_access_key" {
  type    = bool
  default = false
}
variable "static_access_key_pgp_key" {
  type    = string
  default = null
}

variable "enable_api_key" {
  default = false
}
variable "api_key_pgp_key" {
  type    = string
  default = null
}

variable "enable_account_key" {
  type    = bool
  default = false
}
variable "account_key_algorithm" {
  type    = string
  default = "RSA_4096"
}
variable "account_key_format" {
  type    = string
  default = "PEM_FILE"
}
variable "account_key_pgp_key" {
  type    = string
  default = null
}

variable "policy_binding" {
  description = "List of IAM policies"
  type = list(object({
    role    = string
    members = list(string)
  }))
  default = []
}
