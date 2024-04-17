terraform {
  required_version = ">= 0.13.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.22"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.1"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.48.0"
    }
  }
}
