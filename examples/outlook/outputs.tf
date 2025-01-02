output "connection_id" {
  description = "Api Connection Resource ID."
  value       = module.api_connection.connection_id
}

output "managed_api_id" {
  description = "Managed API ID."
  value       = module.api_connection.managed_api_id
}

output "connection_name" {
  description = "Api Connection Name."
  value       = module.api_connection.connection_name
}

output "logic_app_parameter" {
  description = "Logic Apps Managed Identity Output to use in Logic App Parameters to configure this connection."
  value       = module.api_connection.logic_app_parameter
}
