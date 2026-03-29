resource "azurerm_cosmosdb_account" "main" {
  name                = "cosmos-projeto-iac-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}


resource "azurerm_cosmosdb_sql_database" "main" {
  name                = "cosmosdb-projeto-iac-${var.environment}"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main.name

}

resource "azurerm_cosmosdb_sql_container" "main" {
  name                = "container-projeto-iac-${var.environment}"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main.name
  database_name       = azurerm_cosmosdb_sql_database.main.name
  partition_key_paths = ["/id"]
}