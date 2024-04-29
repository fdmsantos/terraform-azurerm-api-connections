# Azure API Connections Terraform Module

[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

Dynamic Terraform Module to Create Azure API Connections.

## Table of Contents

* [Module versioning rule](README.md#module-versioning-rule)
* [Supported Connections](README.md#supported-connections)
* [How to Use](README.md#how-to-use)
    * [Azure Blob](README.md#azure-blob)
    * [Sharepoint Online](README.md#sharepoint-online)
* [Examples](README.md#examples)
* [Contributing](README.md#contributing)
* [License](README.md#license)


## Module versioning rule

| Module version | Azure Provider version |
|----------------|------------------------|
| >= 1.x.x       | => 3.22                |

## Supported Connections

- Azure Blob (All 4 types of authentication)
- Sharepoint Online

## How to Use

### Azure Blob

This example creates Api Connection to Azure blob storage using service principal as authentication. Please check [here](https://github.com/fdmsantos/terraform-azurerm-api-connections/tree/main/examples/azureblob) for examples to another supported authentication types.

```hcl
module "azureblob" {
  source                               = "fdmsantos/api-connections/azurerm"
  version                              = "x.x.x"
  api_type                             = "azureblob"
  connection_name                      = "azureblob-1"
  deployment_name                      = "azureblob-deployment"
  resource_group_name                  = "<resource_group_name>"
  connection_display_name              = "<display_name"
  azureblob_authentication_type        = "Service Principal"
  auth_service_principal_client_id     = "<service_principal_client_id>"
  auth_service_principal_client_secret = "<service_principal_client_secret>"
  auth_service_principal_tenant_id     = "<service_principal_client_tenant_id>"
}
```

### Sharepoint Online

```hcl
module "sharepointonline" {
  source                  = "fdmsantos/api-connections/azurerm"
  version                 = "x.x.x"
  api_type                = "sharepointonline"
  resource_group_name     = "<resource_group_name>"
  connection_display_name = "Demo Sharepoint Connection"
}
```

## Examples

- [azureblob](https://github.com/fdmsantos/terraform-azurerm-api-connections/tree/main/examples/azureblob) - Creates an api connection to azure blob storage.
- [sharepointonline](https://github.com/fdmsantos/terraform-azurerm-api-connections/tree/main/examples/sharepointonline) - Creates an api connection to sharepoint.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group_template_deployment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_type"></a> [api\_type](#input\_api\_type) | Specifies the type of the Managed API. | `string` | n/a | yes |
| <a name="input_auth_service_principal_client_id"></a> [auth\_service\_principal\_client\_id](#input\_auth\_service\_principal\_client\_id) | Service Principal Client Id. Required when `*_authentication_type` is `Service Principal` | `string` | `null` | no |
| <a name="input_auth_service_principal_client_secret"></a> [auth\_service\_principal\_client\_secret](#input\_auth\_service\_principal\_client\_secret) | Service Principal Client Secret. Required when `*_authentication_type` is `Service Principal` | `string` | `null` | no |
| <a name="input_auth_service_principal_tenant_id"></a> [auth\_service\_principal\_tenant\_id](#input\_auth\_service\_principal\_tenant\_id) | Service Principal Tenant Id. Required when `*_authentication_type` is `Service Principal` | `string` | `null` | no |
| <a name="input_azureblob_authentication_type"></a> [azureblob\_authentication\_type](#input\_azureblob\_authentication\_type) | Specifies Authentication Type for `azureblob` api connection. | `string` | `"Logic Apps Managed Identity"` | no |
| <a name="input_azureblob_storage_account_access_key"></a> [azureblob\_storage\_account\_access\_key](#input\_azureblob\_storage\_account\_access\_key) | Specifies storage access key for `azureblob` api connection.  Required when `azureblob_authentication_type` is `Access Key` | `string` | `null` | no |
| <a name="input_azureblob_storage_account_name"></a> [azureblob\_storage\_account\_name](#input\_azureblob\_storage\_account\_name) | Specifies storage account name for `azureblob` api connection. Required when `azureblob_authentication_type` is `Access Key` | `string` | `null` | no |
| <a name="input_connection_display_name"></a> [connection\_display\_name](#input\_connection\_display\_name) | A display name for this API Connection. Changing this forces a new API Connection to be created. | `string` | `null` | no |
| <a name="input_connection_name"></a> [connection\_name](#input\_connection\_name) | The Name which should be used for this API Connection. Changing this forces a new API Connection to be created. | `string` | `null` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | The name which should be used for this Resource Group Template Deployment. Changing this forces a new Resource Group Template Deployment to be created. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group where the logic should exists. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_id"></a> [connection\_id](#output\_connection\_id) | Api Connection Resource ID. |
| <a name="output_connection_name"></a> [connection\_name](#output\_connection\_name) | Api Connection Name. |
| <a name="output_logic_app_parameter"></a> [logic\_app\_parameter](#output\_logic\_app\_parameter) | Output to use in Logic App Parameters to configure this connection. |
| <a name="output_managed_api_id"></a> [managed\_api\_id](#output\_managed\_api\_id) | Managed API ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

The goal is to have the maximum number of supported Azure API connections. To help achieve this objective, contributions via issues or pull requests are welcome.

## License

Apache 2 Licensed. See [LICENSE](https://github.com/fdmsantos/terraform-azurerm-api-connections/tree/main/LICENSE) for full details.
