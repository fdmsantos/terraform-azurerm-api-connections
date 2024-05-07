####### Deployment #######
output "deployment_name" {
  description = "The Deployment name."
  value       = azurerm_resource_group_template_deployment.this.name
}

output "deployment_id" {
  description = "The Deployment ID."
  value       = azurerm_resource_group_template_deployment.this.id
}

output "deployment_output_content" {
  description = "The Deployment Output Content."
  value       = azurerm_resource_group_template_deployment.this.output_content
}
####### Connection #######
output "connection_id" {
  description = "Api Connection Resource ID."
  value       = jsondecode(azurerm_resource_group_template_deployment.this.output_content).connectionId.value
}

output "managed_api_id" {
  description = "Managed API ID."
  value       = jsondecode(azurerm_resource_group_template_deployment.this.output_content).managedApiId.value
}

output "connection_name" {
  description = "Api Connection Name."
  value       = local.connection_name
}

output "connection_display_name" {
  description = "Api Connection Display Name."
  value       = local.connection_display_name
}

####### Logic App #######
output "logic_app_parameter" {
  description = "Output to use in Logic App Parameters to configure this connection."
  value       = local.logic_app_parameters
}
