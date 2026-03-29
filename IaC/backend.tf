terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate12174"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
    use_oidc             = false
  }
}

