variable "name" {
  description = "Specifies the name of resource group."
  type        = string
}

variable "location" {
  description = "Specifies the Azure Region where the logic app should exists. Changing this forces a new resource to be created."
  type        = string
  default     = "westeurope"
}

variable "subscription_id" {
  description = "Specifies the subscription id should be used for this demo."
  type        = string
}
