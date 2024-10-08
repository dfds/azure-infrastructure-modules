locals {
  # Get the current date and time
  current_timestamp = timestamp()

  # Extract the current year and month, and construct the first day of the current month
  current_year  = formatdate("YYYY", local.current_timestamp)
  current_month = formatdate("MM", local.current_timestamp)
  start_date    = "${local.current_year}-${local.current_month}-01T00:00:00Z"
  
  # Add 12 months to the start date to get the end date
  end_date = timeadd(local.start_date, "8760h") # 8760 hours in 12 months

  role_definition = "DFDS Developer"
}

data "azuread_group" "capability_ssu_group" {
  count = var.enable_capability_access ? 1 : 0
  display_name = "CI_SSU_Cap - ${var.capability_id}"
}
data "azuread_group" "capability_access_group" {
  count        = var.enable_capability_access ? 1 : 0
  display_name = "CI_SSU_Cap - ${var.environment == "uat" ? "UAT" : upper(substr(var.environment, 0, 1))}${var.environment == "uat" ? "" : lower(substr(var.environment, 1, -1))} developers"
}
