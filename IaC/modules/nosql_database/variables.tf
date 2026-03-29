variable "resource_group_name" {
    description = "Nome do Resource Group onde o Cosmos DB vai ser criado"
    type = string
  
}

variable "location" {
    description = "Localização do Resource Group onde o Cosmos DB vai ser criado"
    type = string
  
}

variable "environment" {
    description = "Ambiente do Resource Group onde o Cosmos DB vai ser criado"
    type = string
}