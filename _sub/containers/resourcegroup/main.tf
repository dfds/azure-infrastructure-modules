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

locals {
  # Get the current date and time
  current_timestamp = timestamp()

  # Extract the current year and month, and construct the first day of the current month
  current_year  = formatdate("YYYY", local.current_timestamp)
  current_month = formatdate("01", local.current_timestamp)
  start_date    = "${local.current_year}-${local.current_month}-01T00:00:00Z"

  # Add 12 months to the start date to get the end date
  end_date = timeadd(local.start_date, "8760h") # 8760 hours in 12 months
}

resource "azurerm_consumption_budget_resource_group" "main" {
  name                = "${azurerm_resource_group.main.name}-budget"
  resource_group_id  = azurerm_resource_group.main.id
  amount              = 5000.00
  time_grain          = "Annually"
  time_period {
    start_date = local.start_date
    end_date   = local.end_date
  }
  notification {
    enabled       = true
    operator      = "EqualTo"
    threshold     = 90
    contact_emails = ["azureadminalerts@DFDS.onmicrosoft.com"]
  }

  lifecycle {
    ignore_changes = [
      time_period
    ]
  }
}