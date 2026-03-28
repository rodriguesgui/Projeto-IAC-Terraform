# 🏗️ IaC Azure Environment

> Infraestrutura como Código para provisionamento de ambiente de- dados na Azure — parte do portfólio de Engenharia de Dados.

---

## 📌 Sobre o Projeto

Este repositório provisiona e gerencia a infraestrutura base de um ambiente de dados na Azure utilizando **Terraform**. É o primeiro de uma série de projetos que juntos formam um ambiente completo de Engenharia de Dados.

O ambiente provisionado inclui:
- **Azure SQL** — banco de dados relacional gerenciado
- **Cosmos DB** — banco de dados NoSQL com API SQL (Core)

A execução é feita via **container Docker**, garantindo consistência de ambiente em qualquer máquina.

---

## 🗺️ Contexto no Portfólio

Este projeto é a **fundação** que os demais projetos utilizam. A Azure é o elo entre os repositórios — cada projeto consome a infraestrutura provisionada aqui.

| Projeto | Repositório | Depende deste? |
|---|---|---|
| IaC Azure Environment | ← você está aqui | — |
| DW Modeling | em breve | ✅ sim |
| Pipelines Airbyte + dbt | em breve | ✅ sim |
| Lakehouse Databricks | em breve | ✅ sim |
| Streaming Spark + Kafka | em breve | ✅ sim |

---

## 🛠️ Tecnologias

- [Terraform](https://www.terraform.io/) `>= 1.8`
- [Azure Provider (azurerm)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Docker](https://www.docker.com/)
- [GitHub Actions](https://docs.github.com/en/actions)

---

## 📁 Estrutura do Projeto

```
projeto-iac-terraform/
├── Dockerfile                        # Ambiente de execução com Terraform + Azure CLI
├── .dockerignore
├── Makefile                          # Atalhos de comandos
├── README.md
├── CHANGELOG.md
├── .github/
│   └── workflows/
│       └── terraform.yml             # Pipeline de CI/CD
├── docs/
│   └── decisions.md                  # Registro de decisões arquiteturais
└── IaC/
    ├── backend.tf                    # State remoto no Azure Storage
    ├── main.tf                       # Arquivo principal
    ├── provider.tf                   # Configuração do provedor Azure
    ├── variables.tf                  # Declaração de variáveis
    ├── outputs.tf                    # Outputs gerados após o apply
    ├── terraform.tfvars.example      # Exemplo de variáveis sem secrets
    ├── environments/
    │   ├── dev/                      # Ambiente de desenvolvimento (ativo)
    │   └── prod/                     # Ambiente de produção (em breve)
    └── modules/
        ├── sql_database/             # Azure SQL Server + Database
        └── nosql_database/           # Cosmos DB Account + Container
```

---

## ⚙️ Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) com WSL 2 habilitado
- [WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install) com Ubuntu
- Conta Azure ativa ([free tier disponível](https://azure.microsoft.com/en-us/free/))
- Repositório clonado localmente

---

## 🚀 Como Executar

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/iac-azure-environment.git
cd iac-azure-environment
```

### 2. Configure as variáveis

```bash
cp IaC/terraform.tfvars.example IaC/terraform.tfvars
# edite o arquivo com seus valores
```

### 3. Build da imagem Docker

```bash
make build
```

### 4. Inicie o container

```bash
make run
```

### 5. Dentro do container, autentique na Azure

```bash
az login
```

### 6. Execute o Terraform

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔄 CI/CD

O pipeline do GitHub Actions executa automaticamente:

| Evento | Ação |
|---|---|
| Pull Request aberto | `terraform fmt` + `terraform plan` |
| Merge na `main` | `terraform apply` |

As credenciais do Service Principal são armazenadas nas **secrets do repositório** — nunca no código.

---

## 📝 Decisões Arquiteturais

As decisões técnicas deste projeto estão documentadas em [`docs/decisions.md`](docs/decisions.md), incluindo:
- Escolha da API SQL no Cosmos DB
- Estrutura de módulos e environments
- Estratégia de state remoto

---

## 📋 Changelog

Veja [`CHANGELOG.md`](CHANGELOG.md) para o histórico de mudanças por fase da formação.

---

## 🔮 Próximas Evoluções

- [ ] **Módulo 2** — Reestruturação do Azure SQL com arquitetura Medallion (bronze, silver, gold)
- [ ] **Módulo 3** — Adição de módulo para suportar pipelines Airbyte + dbt
- [ ] **Módulo 4** — Azure Data Lake Storage Gen2 + Databricks
- [ ] **Módulo 5** — Azure Event Hubs para streaming com Kafka

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.