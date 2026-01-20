
resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.servername
  name                         = each.key
  resource_group_name          = each.value.rgname
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password


}
