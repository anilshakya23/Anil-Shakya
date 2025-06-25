variable "resource_group_name" {
  description = "The name of the resource group where the VM will be created."
  type        = string  
  
}
variable "network_interface_backend_name" {
  description = "The name of the backend network interface."
  type        = string
}

variable "network_interface_location" {
  description = "The location of the network interface."
  type        = string
}   

variable "ip_backend_configuration_name" {
  description = "The name of the backend IP configuration."
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The private IP address allocation method (Static or Dynamic)."
  type        = string
  default     = "Dynamic"
}
variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "virtual_machine_location" {
  description = "The location of the virtual machine."
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
}
variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  sensitive   = true
}
variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string
  default     = "Canonical"
}
variable "image_offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  default     = "22_04-lts"
}
variable "image_version" {
  description = "The version of the image to use for the virtual machine."
  type        = string
  default     = "latest"
}
variable "backend_subnet_data_name" {
    description = "The name of the backend subnet to be used in data source."
    type        = string
    default     = ""
}
variable "virtual_network_name" {
    description = "The name of the virtual network where the subnet is located."
    type        = string
    default     = ""
}

variable "backend_data_public_ip_name" {
    description = "The name of the backend public IP."
    type        = string
    default     = ""
  
}