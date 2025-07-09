resource "azurerm_subnet" "subnet" {
  for_each             = var.subnetname
  name                 = each.value.name
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes

}
