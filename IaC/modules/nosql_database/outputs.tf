output "cosmosdb_account_name" {
    description = "Nome da conta do Cosmos DB criada"
    value = azurerm_cosmosdb_account.main.name
}

output "cosmosdb_endpoint" {
    description = "Endpoint da conexão do cosmos db"
    value = azurerm_cosmosdb_account.main.endpoint
}

output "cosmosdb_primary_key" {
    description = "Chave de acesso principal do Cosmos DB"
    value = azurerm_cosmosdb_account.main.primary_key
    sensitive = true
}

output "cosmosdb_database_name" {
    description = "Nome do SQL Database criado no Cosmos DB"
    value = azurerm_cosmosdb_sql_database.main.name
}