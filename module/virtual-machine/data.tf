data "azurerm_public_ip" "datapublic" {
  for_each = {
  for k, v in var.lvmm : k => v if v.use_public_ip
}
  name                = each.value.pipname
  resource_group_name = each.value.rgname
}

data "azurerm_subnet" "datasubnet" {
  for_each             = var.lvmm
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}
