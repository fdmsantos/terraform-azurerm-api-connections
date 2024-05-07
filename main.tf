resource "azurerm_resource_group_template_deployment" "this" {
  name                = coalesce(var.deployment_name, "${var.api_type}-connection-deployment")
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_content    = local.template[var.api_type]
  parameters_content = jsonencode({
    name = {
      value = coalesce(var.connection_name, var.api_type)
    }
    displayName = {
      value = coalesce(var.connection_display_name, var.connection_name, var.api_type)
    }
    tags = {
      value = var.connection_tags
    }
  })
  tags = var.deployment_tags
}
