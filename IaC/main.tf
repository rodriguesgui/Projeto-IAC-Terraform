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
  location           = var.location
  environment        = var.environment
  sql_admin_login    = var.sql_admin_login
  sql_admin_password = var.sql_admin_password
}

module "nosql_database" {
  source = ".modules/nosql_database"

  resouce_group_name = azuremrm_resource_group.main.name
  location           = var.location
  environment        = var.environment
}