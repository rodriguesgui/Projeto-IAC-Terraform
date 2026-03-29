output "sql_server_name" {
  description = "Nome do SQL Server criado"
  value       = azurerm_mssql_server.main.name
}

output "sql_database_id" {
  description = "ID do SQL Database criado"
  value       = azurerm_mssql_database.main.id
}

output "sql_database_name" {
  description = "Nome do SQL Database criado"
  value       = azurerm_mssql_database.main.name
}