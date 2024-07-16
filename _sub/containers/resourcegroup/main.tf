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

resource "azurerm_consumption_budget_resource_group" "main" {
  name                = "${azurerm_resource_group.main.name}-budget"
  resource_group_id  = azurerm_resource_group.main.id
  amount              = 5000.00
  time_grain          = "Annually"
  time_period {
    start_date        = formatdate("yyyy-MM-dd", timestamp())
    end_date          = formatdate("yyyy-MM-dd", timeadd(timestamp(), "8760h"))
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