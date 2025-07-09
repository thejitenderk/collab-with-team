resource "azurerm_public_ip" "pip" {
  for_each            = var.publicip
  name                = each.value.name
  location            = each.value.rgloc
  resource_group_name = each.value.rgname
  allocation_method   = "Dynamic"
  sku                 = "Basic"

}
