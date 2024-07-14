resource "azuread_group" "main" {
  count = length(data.azuread_groups.capability_ssu_group.object_ids) == 0 ? 1 : 0
  display_name     = var.displayname
  security_enabled = true
  assignable_to_role = false
}