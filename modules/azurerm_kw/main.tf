variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  
}
variable "key_vault_location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
} 
variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
}

resource "azurerm_key_vault" "kw" {
  name                        = var.key_vault_name
  location                    = var.key_vault_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}