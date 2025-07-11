resource "azurerm_subnet_network_security_group_association" "subnet_association" {
    for_each = var.subnet_association
  subnet_id                 = data.azurerm_subnet.subnetdata.id
  network_security_group_id = data.azurerm_network_security_group.nsgdata.id
}


