module "resourcegroup" {
  source   = "../_sub/containers/resourcegroup"
  location = "westeurope"
  rg_name  = var.name
  
  tags = {
    "name"               = var.name
    "Tribe"              = "YourTribeValue"
    "Team"               = "YourTeamValue"
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
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
    "email"              = var.email
    "context_id"         = var.context_id
    "correlation_id"     = var.correlation_id
    "capability_name"    = var.capability_name
    "capability_root_id" = var.capability_root_id
    "context_name"       = var.context_name
    "capability_id"      = var.capability_id
  }
}