# output "group_id" {
#   value = azuread_group.main.id
# }
output "group_id" {
  value = length(data.azuread_groups.capability_ssu_group) > 0 ? data.azuread_groups.capability_ssu_group[0].id : azuread_group.adgroup[0].id
}