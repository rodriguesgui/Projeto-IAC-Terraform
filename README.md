# Projeto IAC Terraform

> Infraestrutura como Código para provisionamento de ambiente de dados na Azure — parte do portfólio de Engenharia de Dados.

---

## Sobre o Projeto

Este repositório provisiona e gerencia a infraestrutura base de um ambiente de dados na Azure utilizando Terraform. É o primeiro de uma série de projetos que juntos formam um ambiente completo de Engenharia de Dados.

O ambiente provisionado inclui:
- **Azure SQL** — banco de dados relacional gerenciado
- **Cosmos DB** — banco de dados NoSQL com API SQL (Core)

A execução é feita via container Docker, garantindo consistência de ambiente em qualquer máquina.

---

## Contexto no Portfólio

Este projeto é a fundação que os demais projetos utilizam. A Azure é o elo entre os repositórios — cada projeto consome a infraestrutura provisionada aqui.

| Projeto | Repositório | Depende deste? |
|---|---|---|
| IaC Azure Environment | ← você está aqui | — |
| DW Modeling | em breve | ✅ sim |
| Pipelines Airbyte + dbt | em breve | ✅ sim |
| Lakehouse Databricks | em breve | ✅ sim |
| Streaming Spark + Kafka | em breve | ✅ sim |

---

## Tecnologias

- [Terraform](https://www.terraform.io/) `>= 1.8`
- [Azure Provider (azurerm)](https://registry.terraform.io/providers/hashicorp/azurerm/latest) `~> 4.66.0`
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Docker](https://www.docker.com/)
- [GitHub Actions](https://docs.github.com/en/actions)

---

## Estrutura do Projeto

```
Projeto-IAC-Terraform/
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

## Pré-requisitos

Antes de começar, você precisa ter:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado e rodando
- [WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install) com Ubuntu habilitado
- Integração do Docker Desktop com WSL habilitada em **Settings → Resources → WSL Integration**
- Conta Azure ativa ([free tier disponível](https://azure.microsoft.com/en-us/free/))

---

## Como Executar

### 1. Clone o repositório

```bash
git clone https://github.com/rodriguesgui/Projeto-IAC-Terraform.git
cd Projeto-IAC-Terraform
```

### 2. Configure as variáveis

```bash
cp IaC/terraform.tfvars.example IaC/terraform.tfvars
```

Edite o arquivo `IaC/terraform.tfvars` com seus valores:

```hcl
subscription_id     = "seu-subscription-id"
resource_group_name = "rg-projeto-iac-dev"
location            = "brazilsouth"
environment         = "dev"
sql_admin_login     = "seu-admin-login"
sql_admin_password  = "SuaSenhaForte@2024"
client_id           = "seu-client-id"
client_secret       = "seu-client-secret"
tenant_id           = "seu-tenant-id"
```

> As credenciais `client_id`, `client_secret` e `tenant_id` vêm de um Service Principal criado na Azure. Veja como criar em [Autenticação via Service Principal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret).

### 3. Crie o Storage Account para o state remoto

Este passo é feito **uma única vez** antes do primeiro `terraform init`. Ele cria o backend onde o Terraform vai guardar o state.

Abra o terminal WSL e entre no container:

```bash
docker build -t projeto-iac .
docker run -it --rm -v "$(pwd)/IaC:/IaC" projeto-iac
```

Dentro do container, autentique na Azure e crie os recursos:

```bash
az login

az group create --name rg-terraform-state --location brazilsouth

az storage account create \
  --name stterraformstate$RANDOM \
  --resource-group rg-terraform-state \
  --location brazilsouth \
  --sku Standard_LRS

az storage container create \
  --name tfstate \
  --account-name <nome-gerado-acima>
```

> Anote o nome do Storage Account gerado — você vai precisar dele no próximo passo.

### 4. Execute o Terraform

Ainda dentro do container, rode:

```bash
terraform init \
  -backend-config="resource_group_name=rg-terraform-state" \
  -backend-config="storage_account_name=<nome-do-seu-storage-account>" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=dev.terraform.tfstate" \
  -backend-config="client_id=<seu-client-id>" \
  -backend-config="client_secret=<seu-client-secret>" \
  -backend-config="subscription_id=<seu-subscription-id>" \
  -backend-config="tenant_id=<seu-tenant-id>"

terraform plan

terraform apply
```

### 5. Para destruir a infraestrutura

Quando quiser encerrar e evitar custos:

```bash
terraform destroy
```

---

## CI/CD

O pipeline do GitHub Actions executa automaticamente:

| Evento | Ação |
|---|---|
| Pull Request aberto | `terraform fmt` + `terraform plan` |
| Merge na `main` | `terraform apply` |

Para configurar o CI/CD no seu fork, cadastre os seguintes Secrets em **Settings → Secrets and variables → Actions**:

```
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
SQL_ADMIN_LOGIN
SQL_ADMIN_PASSWORD
```

---

## Decisões Arquiteturais

As decisões técnicas deste projeto estão documentadas em [`docs/decisions.md`](docs/decisions.md).

---

## Changelog

Veja [`CHANGELOG.md`](CHANGELOG.md) para o histórico de mudanças por fase da formação.

---

## Próximas Evoluções

- [ ] **Módulo 2** — Reestruturação do Azure SQL com arquitetura Medallion (bronze, silver, gold)
- [ ] **Módulo 3** — Adição de módulo para suportar pipelines Airbyte + dbt
- [ ] **Módulo 4** — Azure Data Lake Storage Gen2 + Databricks
- [ ] **Módulo 5** — Azure Event Hubs para streaming com Kafka

---

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.