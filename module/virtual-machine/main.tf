resource "azurerm_network_interface" "nic" {
  for_each            = var.lvmm
  name                = each.value.nicname
  location            = each.value.rgloc
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.use_public_ip ? data.azurerm_public_ip.datapublic[each.key].id : null
  }
}

resource "azurerm_linux_virtual_machine" "lvm" {
  for_each                        = var.lvmm
  name                            = each.value.name
  resource_group_name             = each.value.rgname
  location                        = each.value.rgloc
  size                            = "Standard_B1s"
  admin_username                  = each.value.username
  admin_password                  = each.value.password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  custom_data = each.value.customdata

}
