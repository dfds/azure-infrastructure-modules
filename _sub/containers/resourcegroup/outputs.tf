output "resource_group_name" {
  description = "name of the resource group"
  value = {
    resource_group_name = azurerm_resource_group.main.name
  }
}