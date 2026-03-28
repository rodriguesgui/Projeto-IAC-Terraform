resource "azurerm_mssql_server" "main" {
  name                = "sql-server-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

    tags = {
        environment = var.environment
        managed_by  = "terraform"
    }
  
}

resource "azurerm_mssql_database" "main" {
  name = "sqldb-projeto-iac-${var.environment}"
  server_id = azurerm_mssql_server.main.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name = "Basic"

  tags = {
    environment = var.environment
    managed_by = "terraform"
  }
}