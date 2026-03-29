variable "resource_group_name" {
  description = "Nome do Resource Group onde o sql vai ser criado"
  type        = string
}

variable "location" {
  description = "Localização do Resource Group onde o sql vai ser criado"
  type        = string
}

variable "environment" {
  description = "Ambiente do Resource Group onde o sql vai ser criado"
  type        = string
}

variable "sql_admin_login" {
  description = "Login do administrador do SQL Database"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "Senha do administrador do SQL Database"
  type        = string
  sensitive   = true
}