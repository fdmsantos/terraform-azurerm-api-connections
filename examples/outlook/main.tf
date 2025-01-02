resource "azurerm_resource_group" "this" {
  name     = "RG-${title(var.name)}"
  location = var.location
}

module "api_connection" {
  source                  = "../../"
  api_type                = "outlook"
  resource_group_name     = azurerm_resource_group.this.name
  connection_display_name = "Demo Outlook.com Connection"
}
