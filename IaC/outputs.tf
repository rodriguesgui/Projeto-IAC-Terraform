output "resource_group_name" {
  description = "Nome do Resouce Group criado"
  value       = azurerm_resource_group.main.name
}

output "location" {
  description = "Localização do Resource Group criado"
  value       = azurerm_resource_group.main.location
}

output "environment" {
  description = "Ambiente do Resource Group criado"
  value       = var.environment
}