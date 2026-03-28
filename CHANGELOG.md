# Changelog

Este arquivo registra todas as mudanças relevantes do projeto, organizadas por versão e alinhadas com os módulos da Formação Engenheiro de Dados (DSA).

Cada versão corresponde a uma fase de evolução do projeto. O objetivo é manter um histórico claro do que foi adicionado, alterado ou removido — e em qual momento da formação isso aconteceu.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [0.1.0] - 2026-03 — Módulo 1: Infraestrutura Como Código

### Adicionado
- Estrutura inicial do projeto com Terraform
- Provisionamento do Azure SQL Server e Database via módulo `sql_database`
- Provisionamento do Cosmos DB Account e Container via módulo `nosql_database`
- Separação de ambientes com `environments/dev`
- State remoto configurado via Azure Storage Account em `backend.tf`
- Ambiente de execução isolado via Docker com Azure CLI e Terraform
- Makefile com atalhos para build, run e destroy
- Pipeline de CI/CD com GitHub Actions
- Documentação inicial: README, CHANGELOG e decisions.md

---

*As próximas versões serão adicionadas conforme os módulos da formação forem concluídos.*