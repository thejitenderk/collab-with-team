resource "azurerm_public_ip" "pip" {
    name = var.publicip
    location = var.rgloc
    resource_group_name = var.rgname
    allocation_method = "Dynamic"
    sku =  "Basic"
  
}