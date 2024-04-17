output "logic_app_managed_identity_connection_id" {
  description = "Logic Apps Managed Identity Api Connection Resource ID."
  value       = module.api_connection_1.connection_id
}

output "logic_app_managed_identity_managed_api_id" {
  description = "Logic Apps Managed Identity Managed API ID."
  value       = module.api_connection_1.managed_api_id
}

output "logic_app_managed_identity_connection_name" {
  description = "Logic Apps Managed Identity Api Connection Name."
  value       = module.api_connection_1.connection_name
}

output "logic_app_managed_identity_logic_app_parameter" {
  description = "Logic Apps Managed Identity Output to use in Logic App Parameters to configure this connection."
  value       = module.api_connection_1.logic_app_parameter
}

output "access_key_connection_id" {
  description = "Access Key Api Connection Resource ID."
  value       = module.api_connection_2.connection_id
}

output "access_key_managed_api_id" {
  description = "Access Key Managed API ID."
  value       = module.api_connection_2.managed_api_id
}

output "access_key_connection_name" {
  description = "Access Key Api Connection Name."
  value       = module.api_connection_2.connection_name
}

output "access_key_logic_app_parameter" {
  description = "Access Key Output to use in Logic App Parameters to configure this connection."
  value       = module.api_connection_2.logic_app_parameter
}

output "service_principal_connection_id" {
  description = "Service Principal Api Connection Resource ID."
  value       = module.api_connection_3.connection_id
}

output "service_principal_managed_api_id" {
  description = "Service Principal Managed API ID."
  value       = module.api_connection_3.managed_api_id
}

output "service_principal_connection_name" {
  description = "Service Principal Api Connection Name."
  value       = module.api_connection_3.connection_name
}

output "service_principal_logic_app_parameter" {
  description = "Service Principal Output to use in Logic App Parameters to configure this connection."
  value       = module.api_connection_3.logic_app_parameter
}

output "microsoft_entra_connection_id" {
  description = "Microsoft Entra Api Connection Resource ID."
  value       = module.api_connection_4.connection_id
}

output "microsoft_entra_managed_api_id" {
  description = "Microsoft Entra Managed API ID."
  value       = module.api_connection_4.managed_api_id
}

output "microsoft_entra_connection_name" {
  description = "Microsoft Entra Api Connection Name."
  value       = module.api_connection_4.connection_name
}

output "microsoft_entra_logic_app_parameter" {
  description = "Microsoft Entra Output to use in Logic App Parameters to configure this connection."
  value       = module.api_connection_4.logic_app_parameter
}
