
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.servername
  resource_group_name          = var.rgname
  location                     = var.rgloc
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password

  
}