module "adgroup" {
  source        = "../_sub/security/ad-group"
  displayname   = "CI_Cap - ${var.capability_id}"
}


module "resourcegroup" {
  source   = "../_sub/containers/resourcegroup"
  location = "westeurope"
  rg_name  = "rg-${var.name}"
  
  tags = {
    "name"                      = var.name
    "Tribe"                     = var.tribe
    "Team"                      = var.team
    "email"                     = var.email
    "context_id"                = var.context_id
    "correlation_id"            = var.correlation_id
    "capability_name"           = var.capability_name
    "capability_root_id"        = var.capability_root_id
    "context_name"              = var.context_name
    "capability_id"             = var.capability_id
    "dfds.owner"                = var.owner
    "dfds.env"                  = var.environment
    "dfds.cost.centre"          = var.costcentre
    "dfds.service.availability" = var.availability
    "dfds.planned_sunset"       = local.end_date
  }
  start_date = local.start_date
  end_date = local.end_date
}
resource "azurerm_role_assignment" "resourcegroup-main" {
  scope                 = module.resourcegroup.resource_group_id
  role_definition_name  = "Contributor"
  principal_id          = module.adgroup.group_id
}
data "azuread_group" "capability_ssu_group" {
  count = var.enable_capability_access ? 1 : 0
  display_name = "CI_SSU_Cap - ${var.capability_id}"
}

resource "azurerm_role_assignment" "resourcegroup-capability" {
  count = var.enable_capability_access ? 1 : 0
  scope                 = module.resourcegroup.resource_group_id
  role_definition_name  = "Contributor"
  principal_id          = module.adgroup.group_id
}
