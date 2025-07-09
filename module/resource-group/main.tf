resource "azurerm_resource_group" "rg" {
  for_each = var.rgname
  name     = each.value.rgname
  location = each.value.rgloc
}
