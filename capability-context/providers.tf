terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = "73a99466-ad05-4221-9f90-e7142aa2f6c1"
  //skip_provider_registration = true
}

provider "azuread" {

}
