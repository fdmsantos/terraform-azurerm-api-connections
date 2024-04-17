provider "azurerm" {
  skip_provider_registration = true
  subscription_id            = var.subscription_id
  features {}
}
