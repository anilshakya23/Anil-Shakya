# module "resource_group" {
#   source                  = "../modules/azurerm_resource_group"
#   resource_group_name     = "rg-todo"
#   resource_group_location = "westus"

# }
# module "virtual_network" {
#   depends_on              = [module.resource_group]
#   source                  = "../modules/azurerm_virtual_network"
#   resource_group_name     = "rg-todo"
#   resource_group_location = "westus"
#   virtual_network_name    = "todo-vnet"
#   address_space           = ["10.0.0.0/16"]
# }

# module "frontend-subnet" {
#   depends_on           = [module.virtual_network, module.resource_group]
#   source               = "../modules/azurerm_subnet"
#   subnet_name          = "frontend-subnet"
#   resource_group_name  = "rg-todo"
#   virtual_network_name = "todo-vnet"
#   address_prefixes     = ["10.0.1.0/24"]
# }
# module "backend-subnet" {
#   depends_on           = [module.virtual_network, module.resource_group]
#   source               = "../modules/azurerm_subnet"
#   subnet_name          = "backend-subnet"
#   resource_group_name  = "rg-todo"
#   virtual_network_name = "todo-vnet"
#   address_prefixes     = ["10.0.2.0/24"]
# }
# module "public_ip_frontend_address_id" {
#   depends_on              = [module.backend-subnet, module.frontend-subnet]
#   source                  = "../modules/azurerm_public_ip_address"
#   pip_name                = "todo-frontend-public-ip"
#   resource_group_name     = "rg-todo"
#   resource_group_location = "westus"
#   allocation_method       = "Static"
#   sku                     = "Standard"
# }
# module "public_ip_backend_address_id" {
#   depends_on              = [module.backend-subnet, module.frontend-subnet]
#   source                  = "../modules/azurerm_public_ip_address"
#   pip_name                = "todo-backend-public-ip"
#   resource_group_name     = "rg-todo"
#   resource_group_location = "westus"
#   allocation_method       = "Static"
#   sku                     = "Standard"
# }


# module "frontend_vm" {
#   depends_on                      = [module.resource_group, module.public_ip_frontend_address_id, module.frontend-subnet, module.backend-subnet, module.public_ip_backend_address_id, module.virtual_network]
#   source                          = "../modules/azurerm_frontend_vm"
#   virtual_machine_name            = "frontend-vm"
#   resource_group_name             = "rg-todo"
#   virtual_machine_location        = "westus"
#   virtual_machine_size            = "Standard_B1s"
#   admin_username                  = "adminuser"
#   admin_password                  = "P@ssw0rd1234!"
#   network_interface_forntend_name = "nic-frontend"
#   network_interface_location      = "westus"
#   private_ip_address_allocation   = "Dynamic"
#   image_offer                     = "0001-com-ubuntu-server-jammy"
#   image_sku                       = "22_04-lts"
#   image_version                   = "latest"
#   image_publisher                 = "Canonical"
#   backend_subnet_data_name        = "backend-subnet"
#   virtual_network_name            = "todo-vnet"
#   frontend_data_public_ip_name    = "todo-frontend-public-ip"
#   ip_frontend_configuration_name  = "ipconfig-frontend"
#   frontend_subnet_data_name       = "frontend-subnet"
# }

# module "backend_vm" {
#   depends_on                     = [module.resource_group, module.public_ip_frontend_address_id, module.frontend-subnet, module.backend-subnet, module.public_ip_backend_address_id, module.virtual_network]
#   source                         = "../modules/azurerm_backend_vm"
#   virtual_machine_name           = "backend-vm"
#   resource_group_name            = "rg-todo"
#   virtual_machine_location       = "westus"
#   virtual_machine_size           = "Standard_B1s"
#   admin_username                 = "adminuser"
#   admin_password                 = "P@ssw0rd1234!"
#   network_interface_backend_name = "nic-backend"
#   network_interface_location     = "westus"
#   private_ip_address_allocation  = "Dynamic"
#   image_offer                    = "0001-com-ubuntu-server-jammy"
#   image_sku                      = "22_04-lts"
#   image_version                  = "latest"
#   image_publisher                = "Canonical"
#   backend_subnet_data_name       = "backend-subnet"
#   virtual_network_name           = "todo-vnet"
#   ip_backend_configuration_name  = "ipconfig-backend"
#   backend_data_public_ip_name    = "todo-backend-public-ip"
# }
