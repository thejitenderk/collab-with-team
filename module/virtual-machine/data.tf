data "azurerm_public_ip" "datapublic" {
  for_each            = var.lvmm
  name                = each.value.use_public_ip
  resource_group_name = each.value.rgname
}

data "azurerm_subnet" "datasubnet" {
  for_each             = var.lvmm
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}
