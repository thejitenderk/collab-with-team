resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg
  location            = each.value.location
  resource_group_name = each.value.rgname

  dynamic "security_rule" {
    for_each = each.value.security_rule  # ✅ This is the correct source
    content {
      name                       = security_rule.value.name       # ✅ Always use .value
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.dest_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}