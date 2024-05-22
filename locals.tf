locals {
  connection_name         = coalesce(var.connection_name, var.api_type)
  connection_display_name = coalesce(var.connection_display_name, var.connection_name, var.api_type)
  template = {
    azureblob : templatefile("${path.module}/templates/azureblob.tftpl", local.azureblob_template_parameters[var.azureblob_authentication_type])
    sharepointonline : templatefile("${path.module}/templates/sharepointonline.tftpl", {})
    office365 : templatefile("${path.module}/templates/office365.tftpl", {})
  }

  logic_app_parameters = {
    (var.api_type) : {
      connectionId         = jsondecode(azurerm_resource_group_template_deployment.this.output_content).connectionId.value
      connectionName       = local.connection_name
      id                   = jsondecode(azurerm_resource_group_template_deployment.this.output_content).managedApiId.value
      connectionProperties = can(local.logic_app_parameters_properties[var.api_type]) ? local.logic_app_parameters_properties[var.api_type] : {}
    }
  }

  logic_app_parameters_properties = {
    azureblob : var.azureblob_authentication_type == "Logic Apps Managed Identity" ? {
      authentication : {
        type : "ManagedServiceIdentity"
      }
    } : {}
  }

  azureblob_template_parameters = {
    "Logic Apps Managed Identity" : {
      authentication_type  = "managedIdentityAuth"
      storage_account_name = null
      storage_access_key   = null
      client_id            = null
      client_secret        = null
      tenant_id            = null
    }
    "Access Key" : {
      authentication_type  = "keyBasedAuth"
      storage_account_name = var.azureblob_storage_account_name
      storage_access_key   = var.azureblob_storage_account_access_key
      client_id            = null
      client_secret        = null
      tenant_id            = null
    }
    "Service Principal" : {
      authentication_type  = "servicePrincipalAuth"
      storage_account_name = null
      storage_access_key   = null
      client_id            = var.auth_service_principal_client_id
      client_secret        = var.auth_service_principal_client_secret
      tenant_id            = var.auth_service_principal_tenant_id
    }
    "Microsoft Entra ID" : {
      authentication_type  = "tokenBasedAuth"
      storage_account_name = null
      storage_access_key   = null
      client_id            = null
      client_secret        = null
      tenant_id            = null
    }
  }
}
