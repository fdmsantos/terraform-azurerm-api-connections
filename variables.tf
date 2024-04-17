variable "api_type" {
  description = "Specifies the type of the Managed API."
  type        = string
  validation {
    error_message = "Please choose a supported Managed API!"
    condition     = contains(["azureblob", "sharepointonline"], var.api_type)
  }
}

variable "connection_name" {
  description = "The Name which should be used for this API Connection. Changing this forces a new API Connection to be created."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the logic should exists. Changing this forces a new resource to be created."
  type        = string
}

variable "connection_display_name" {
  description = "A display name for this API Connection. Changing this forces a new API Connection to be created."
  type        = string
  default     = null
}

variable "deployment_name" {
  description = "The name which should be used for this Resource Group Template Deployment. Changing this forces a new Resource Group Template Deployment to be created."
  type        = string
  default     = null
}

################ Azure Blob ################
variable "azureblob_authentication_type" {
  description = "Specifies Authentication Type for `azureblob` api connection."
  type        = string
  default     = "Logic Apps Managed Identity"
  validation {
    error_message = "Please choose a supported Authentication Type to azure blob managed api!"
    condition     = contains(["Logic Apps Managed Identity", "Access Key", "Service Principal", "Microsoft Entra ID"], var.azureblob_authentication_type)
  }
}

variable "azureblob_storage_account_name" {
  description = "Specifies storage account name for `azureblob` api connection. Required when `azureblob_authentication_type` is `Access Key`"
  type        = string
  default     = null
}

variable "azureblob_storage_account_access_key" {
  description = "Specifies storage access key for `azureblob` api connection.  Required when `azureblob_authentication_type` is `Access Key`"
  type        = string
  sensitive   = true
  default     = null
}

################ Service Principal ################
variable "auth_service_principal_client_id" {
  description = "Service Principal Client Id. Required when `*_authentication_type` is `Service Principal`"
  type        = string
  default     = null
}

variable "auth_service_principal_client_secret" {
  description = "Service Principal Client Secret. Required when `*_authentication_type` is `Service Principal`"
  type        = string
  default     = null
  sensitive   = true
}

variable "auth_service_principal_tenant_id" {
  description = "Service Principal Tenant Id. Required when `*_authentication_type` is `Service Principal`"
  type        = string
  default     = null
}
