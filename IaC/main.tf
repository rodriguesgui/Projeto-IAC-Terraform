resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project     = "Projeto-iac-terraform"
    managed_by  = "terraform"
  }
}

module "sql_database" {
  source = ".modules/sql_database"

  resouce_group_name = azuremrm_resource_group.main.name
  location = var.location
  environment = var.environment
}

module "nosql_database" {
  source = ".modules/nosql_database"

  resouce_group_name = azuremrm_resource_group.main.name
  location = var.location
  environment = var.environment
}