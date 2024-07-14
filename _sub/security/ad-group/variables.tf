variable "displayname" {
  description = "displayname of the aad group"
  type        = string
}
variable "enable_capability_access" {
  description = "Set up role assignment to Capability Entra ID group"
  type = bool
  default = true
}
variable "capability_id" {
  description = "input from the manifest"
  type        = string
}