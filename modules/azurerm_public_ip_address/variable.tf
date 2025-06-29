variable "pip_name" {
  description = "The name of the Public IP"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the Public IP will be created."
  type        = string
  
}
variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}   
variable "allocation_method" {
  description = "The allocation method for the Public IP (Static or Dynamic)."
  type        = string
  default     = "Static"
}
variable "sku" {
  description = "The SKU for the Public IP (Basic or Standard)."
  type        = string
}

