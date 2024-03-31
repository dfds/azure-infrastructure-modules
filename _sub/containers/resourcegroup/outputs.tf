output "resource_group_name" {
  description = "name of the resource group"
  value = azurerm_resource_group.main.name
}
output "resource_group_id" {
  description = "name of the resource group"
  value = azurerm_resource_group.main.id
}