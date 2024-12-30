variable "name" {
  description = "Specifies the name of resource group."
  type        = string
  default = "apimoduletest"
}

variable "location" {
  description = "Specifies the Azure Region to create api connection. Changing this forces a new resource to be created."
  type        = string
  default     = "westus2"
}

variable "subscription_id" {
  description = "Specifies the subscription id should be used for this demo."
  type        = string
  default = "43e47db3-18b4-4a8d-b9a7-565d9a07e57e"
}