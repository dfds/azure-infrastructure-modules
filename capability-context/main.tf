module "adgroup" {
  source        = "../_sub/security/ad-group"
  displayname   = var.name
}
module "resourcegroup" {
  source   = "../_sub/containers/resourcegroup"
  location = "westeurope"
  rg_name  = var.name
  
  tags = {
    "name"               = var.name
    "Tribe"              = var.tribe
    "Team"               = var.team
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
}
resource "azurerm_role_assignment" "resourcegroup-main" {
  scope              = module.resourcegroup.resource_group_id
  role_definition_id = "Contributor"
  principal_id       = module.adgroup.group_id
}

module "keyvault" {
  source   = "../_sub/security/keyvault"
  name                          = var.name
  tenant_id                     = var.tenant_id
  location                      = "westeurope"
  resource_group_name           = module.resourcegroup.resource_group_name
  enabled_for_disk_encryption   = true
  purge_protection_enabled      = true
  soft_delete_retention_days    = 30
  public_network_access_enabled = true

  tags = {
    "name"               = var.name
    "Tribe"              = var.tribe
    "Team"               = var.team
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
}
module "storage_account" {
  source   = "../_sub/storage/storage-account"
  sa_name                 = var.name
  location                = "westeurope"
  resource_group_name     = module.resourcegroup.resource_group_name
  ad_group_id             = module.adgroup.group_id
  tags = {
    "name"                = var.name
    "Tribe"               = var.tribe
    "Team"                = var.team
    "email"               = var.email
    "context_id"          = var.context_id
    "correlation_id"      = var.correlation_id
    "capability_name"     = var.capability_name
    "capability_root_id"  = var.capability_root_id
    "context_name"        = var.context_name
    "capability_id"       = var.capability_id
  }
}