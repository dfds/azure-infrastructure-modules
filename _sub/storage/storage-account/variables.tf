variable "location" {
  description = "Azure Region where the storage account will be created."
  type        = string
}

variable "sa_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "resource_group_name of the storage account"
  type        = string
}

variable "ad_group_id" {
  description = "The id of the ad group that needs data access"
  type        = string
}

variable "tags" {
  description = "Tags will be set here"
  type        = map(any)
}
