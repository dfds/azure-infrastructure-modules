resource "azuread_group" "main" {
  count            = var.enable_capability_access && length(data.azuread_groups.capability_ssu_group) == 0 ? 1 : 0
  display_name     = var.displayname
  security_enabled = true
  assignable_to_role = false
}