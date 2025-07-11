data "azurerm_subnet" "subnetdata" {
  name                 = var.subnetname
  virtual_network_name = var.vnet
  resource_group_name  = var.rgname
}


data "azurerm_network_security_group" "nsgdata" {
  name                = var.nsg
  resource_group_name = var.rgname
}