
resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.servername
  name                         = each.value.name
  resource_group_name          = each.value.rgname
  location                     = each.value.rgloc
  version                      = "12.0"
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password


}
