variable "location" {
  description = "Azure Region where the resource group will be created."
  type        = string
}

variable "rg_name" {
  description = "Name of the resourcegroup"
  type        = string
}

variable "tags" {
  description = "Tags will be set here"
  type        = map(any)
}
