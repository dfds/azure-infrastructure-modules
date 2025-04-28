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

resource "azurerm_role_assignment" "resourcegroup-capability" {
  count = var.enable_capability_access ? 1 : 0
  scope                 = module.resourcegroup.resource_group_id
  role_definition_name  = "${local.role_definition}"
  principal_id          = data.azuread_group.capability_ssu_group[0].object_id
}

resource "azuread_group_member" "add_ssu_to_access_group" {
  count             = var.enable_capability_access ? 1 : 0
  group_object_id   = data.azuread_group.capability_access_group[0].object_id
  member_object_id  = data.azuread_group.capability_ssu_group[0].object_id
}