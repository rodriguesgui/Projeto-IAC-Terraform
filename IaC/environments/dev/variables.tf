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