resource "azurerm_resource_group_template_deployment" "this" {
  name                = coalesce(var.deployment_name, "${var.api_type}-connection-deployment")
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  debug_level         = var.deployment_debug_level == "BOTH" ? "requestContent, responseContent" : var.deployment_debug_level
  template_content    = local.template[var.api_type]
  parameters_content = jsonencode({
    name = {
      value = local.connection_name
    }
    displayName = {
      value = local.connection_display_name
    }
    tags = {
      value = var.connection_tags
    }
  })
  tags = var.deployment_tags
}
