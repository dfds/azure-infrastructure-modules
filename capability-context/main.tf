module "resourcegroup" {
  source   = "../../_sub/containers/resourcegroup"
  location = "westeurope"
  rg_name  = var.name
  
  tags = {
    "name"               = var.name
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
  providers = {
    azurerm = azurerm
  }
}

module "keyvault" {
  source   = "../../_sub/security/keyvault"
  name                          = var.name
  location                      = local.constants.location
  resource_group_name           = module.resourcegroup.name
  enabled_for_disk_encryption   = true
  purge_protection_enabled      = true
  soft_delete_retention_days    = 30
  public_network_access_enabled = true

  tags = {
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
}