data "azurerm_public_ip" "datapublic" {
  name                = var.publicip
  resource_group_name = var.rgname
}

data "azurerm_subnet" "datasubnet" {
  name                 = var.subnetname
  virtual_network_name = var.vnet
  resource_group_name  = var.rgname
}