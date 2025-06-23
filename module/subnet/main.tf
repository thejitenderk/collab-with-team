resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = var.vnet
  address_prefixes = var.address_prefixes

}
