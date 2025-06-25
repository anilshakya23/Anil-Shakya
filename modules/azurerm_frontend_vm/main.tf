data "azurerm_subnet" "frontend_subnet_data" {
  name                 = var.frontend_subnet_data_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
data "azurerm_public_ip" "frontend_public_ip" {
  name                = var.frontend_data_public_ip_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "frontend_nic" {
  name                = var.network_interface_forntend_name
  location            = var.network_interface_location
  resource_group_name = var.resource_group_name
  
  ip_configuration {
    name                          = var.ip_frontend_configuration_name
    subnet_id                     = data.azurerm_subnet.frontend_subnet_data.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.frontend_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.virtual_machine_location
  size                = var.virtual_machine_size
  admin_password      = var.admin_password
  admin_username      = var.admin_username
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.frontend_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}

