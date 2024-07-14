# output "group_id" {
#   value = azuread_group.main.id
# }
# output "group_id" {
#   value = length(data.azuread_groups.capability_ssu_group) > 0 ? data.azuread_groups.capability_ssu_group[0].id : azuread_group.main[0].id
# }
output "group_id" {
  value = length(data.azuread_groups.capability_ssu_group) > 0 ? data.azuread_groups.capability_ssu_group.object_ids[0] : azuread_group.main[0].id
}
