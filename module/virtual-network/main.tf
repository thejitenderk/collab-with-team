resource "azurerm_virtual_network" "vnet" {
    name = var.vnet
    location = var.rgloc
    resource_group_name = var.rgname
    address_space = var.address_space
  
}