resource "azuread_group" "main" {
  display_name       = var.displayname
  security_enabled   = true
  assignable_to_role = false
}