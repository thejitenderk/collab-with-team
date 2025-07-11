data "azurerm_network_interface" "nic" {
  for_each            = var.nicnsgass
  name                = each.value.nicname
  resource_group_name = each.value.rgname
}

data "azurerm_network_security_group" "nsgdata" {
  for_each            = var.nicnsgass
  name                = each.value.nsg
  resource_group_name = each.value.rgname
}
