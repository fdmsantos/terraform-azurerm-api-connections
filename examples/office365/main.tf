resource "azurerm_resource_group" "this" {
  name     = "RG-${title(var.name)}"
  location = var.location
}

module "api_connection" {
  source                  = "../../"
  api_type                = "office365"
  resource_group_name     = azurerm_resource_group.this.name
  connection_display_name = "Demo Office365 Connection"
}
