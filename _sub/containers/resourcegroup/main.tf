resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags

  lifecycle {
    ignore_changes = [
      tags, 
    ]
  }
}
