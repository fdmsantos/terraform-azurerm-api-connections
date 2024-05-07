resource "azurerm_resource_group" "this" {
  name     = "RG-${title(var.name)}"
  location = var.location
}

###### Authentication: Logic App Managed Identity ######
module "api_connection_1" {
  source                        = "../../"
  api_type                      = "azureblob"
  resource_group_name           = azurerm_resource_group.this.name
  connection_display_name       = "Demo Azure Blob Logic App Connection - Logic App Managed Identity Auth"
  azureblob_authentication_type = "Logic Apps Managed Identity"
  connection_tags = {
    env : "dev"
    usedBy : "Logic App"
  }
  deployment_tags = {
    env : "dev"
  }
}

###### Authentication: Access Key ######
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "this" {
  name                     = lower("${replace(var.name, "-", "")}${random_string.random.result}")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "api_connection_2" {
  source                               = "../../"
  api_type                             = "azureblob"
  connection_name                      = "azureblob-2"
  deployment_name                      = "azureblob-deployment-2"
  resource_group_name                  = azurerm_resource_group.this.name
  connection_display_name              = "Demo Azure Blob Logic App Connection - Access Key Auth"
  azureblob_authentication_type        = "Access Key"
  azureblob_storage_account_name       = azurerm_storage_account.this.name
  azureblob_storage_account_access_key = azurerm_storage_account.this.primary_access_key
}

###### Authentication: Service Principal ######
data "azurerm_client_config" "current" {}

resource "azuread_application" "this" {
  display_name = "${var.name}-sp"
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.object_id
}

module "api_connection_3" {
  source                               = "../../"
  api_type                             = "azureblob"
  connection_name                      = "azureblob-3"
  deployment_name                      = "azureblob-deployment-3"
  resource_group_name                  = azurerm_resource_group.this.name
  connection_display_name              = "Demo Azure Blob Logic App Connection - Service Principal Auth"
  azureblob_authentication_type        = "Service Principal"
  auth_service_principal_client_id     = azuread_application.this.client_id
  auth_service_principal_client_secret = azuread_service_principal_password.this.value
  auth_service_principal_tenant_id     = data.azurerm_client_config.current.tenant_id
}

###### Authentication: Microsoft Entra ID Integrated ######
module "api_connection_4" {
  source                        = "../../"
  api_type                      = "azureblob"
  connection_name               = "azureblob-4"
  deployment_name               = "azureblob-deployment-4"
  resource_group_name           = azurerm_resource_group.this.name
  connection_display_name       = "Demo Azure Blob Logic App Connection - Microsoft Entra ID"
  azureblob_authentication_type = "Microsoft Entra ID"
}
