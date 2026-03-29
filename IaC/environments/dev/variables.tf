variable "subscription_id" {
  description = "ID da subscription Azure"
  type        = string
  sensitive   = true
}

variable "sql_admin_login" {
  description = "Login do administrador do SQL Server"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "Senha do administrador do SQL Server"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "rg-projeto-iac-dev"
}

variable "location" {
  description = "Região Azure"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Ambiente de execução"
  type        = string
  default     = "dev"
}