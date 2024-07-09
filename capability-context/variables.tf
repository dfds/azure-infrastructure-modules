variable "name" {
  description = "input from the manifest"
  type        = string
}
variable "tenant_id" {
  description = "UUId of the tenant"
  type        = string
}
variable "email" {
  description = "input from the manifest"
  type        = string
}

variable "tribe" {
  description = "tribe used for Azure tagging"
  type        = string
}
variable "team" {
  description = "team used for Azure tagging"
  type        = string
}

variable "context_id" {
  description = "input from the manifest"
  type        = string
}

variable "correlation_id" {
  description = "input from the manifest"
  type        = string
}

variable "capability_name" {
  description = "input from the manifest"
  type        = string
}

variable "capability_root_id" {
  description = "input from the manifest"
  type        = string
}

variable "context_name" {
  description = "input from the manifest"
  type        = string
}

variable "capability_id" {
  description = "input from the manifest"
  type        = string
}
variable "owner" {
  description = "input from the manifest"
  type        = string
}
variable "environment" {
  description = "input from the manifest"
  type        = string
}
variable "costcentre" {
  description = "input from the manifest"
  type        = string
}
variable "availability" {
  description = "input from the manifest"
  type        = string
}

variable "planned_sunset" {
  description = "input from the manifest"
  type        = string
}

variable "enable_capability_access" {
  description = "Set up role assignment to Capability Entra ID group"
  type = bool
  default = true
}