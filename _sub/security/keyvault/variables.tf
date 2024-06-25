variable "name" {
  description = "name of the keyvault"
  type        = string
}
variable "tenant_id" {
  description = "UUId of the tenant"
  type        = string
}
variable "location" {
  description = "location of the keyvault"
  type        = string
}

variable "resource_group_name" {
  description = "resource_group_name of the keyvault"
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "enabled_for_disk_encryption"
  type        = bool
}

variable "purge_protection_enabled" {
  description = "purge_protection_enabled"
  type        = bool
}

variable "soft_delete_retention_days" {
  description = "soft_delete_retention_days"
  type        = number
}

variable "public_network_access_enabled" {
  description = "public_network_access_enabled of the keyvault"
  type        = bool
}

variable "tags" {
  description = "Tags will be set here"
  type        = map(any)
  default     = []
}
