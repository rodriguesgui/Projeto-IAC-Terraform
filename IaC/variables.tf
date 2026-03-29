variable "subscription_id" {
  description = "ID da subscription Azure"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Região Azure onde os recursos serão criados"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "environment" {
  description = "Ambiente de execução (dev ou prod)"
  type        = string
  default     = "dev"
}

variable "sql_admin_login" {
  description = "login do adm do sql server"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "senha do adm do sql server"
  type        = string
  sensitive   = true
}