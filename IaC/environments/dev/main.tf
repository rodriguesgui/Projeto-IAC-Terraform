module "projeto_iac" {
  source = "../../"

  subscription_id     = var.subscription_id
  resource_group_name = "rg-projeto-iac-dev"
  location            = "eastus"
  environment         = "dev"
  sql_admin_login     = var.sql_admin_login
  sql_admin_password  = var.sql_admin_password
}