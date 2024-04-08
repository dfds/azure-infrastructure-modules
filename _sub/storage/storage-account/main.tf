resource "azurerm_storage_account" "main" {
  name                             = replace(var.sa_name, "-", "")
  location                         = var.location
  resource_group_name              = var.resource_group_name
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  tags                             = var.tags
  enable_https_traffic_only        = true
  min_tls_version                  = "TLS1_2"
  cross_tenant_replication_enabled = false
  public_network_access_enabled    = true
  shared_access_key_enabled        = true
}

resource "azurerm_storage_container" "storage_mgmt_module_container" {
  name                  = azurerm_storage_account.main.name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "blob"
}

resource "azurerm_role_assignment" "psmodules_data_contributor" {
  scope                = azurerm_storage_account.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.ad_group_id
}