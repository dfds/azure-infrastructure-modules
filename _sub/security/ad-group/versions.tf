terraform {
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 3.112.0"
    }
    azuread = {
        source  = "hashicorp/azuread"
        version = "~> 2.45.0"
    }
  }
}
