data "azuread_groups" "capability_ssu_group" {
  count = var.enable_capability_access ? 1 : 0
  display_names = ["CI_SSU_Cap - ${var.capability_id}"]
  ignore_missing = true
}