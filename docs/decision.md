## Decisão 1 — Usar Docker como ambiente de execução

**Status:** Ativo

**Contexto:**
O projeto precisava de um ambiente para executar o Terraform e o Azure CLI
sem depender de instalações locais na máquina do desenvolvedor.

**Alternativas consideradas:**
- Instalar Terraform e Azure CLI diretamente no WSL
- Usar Docker com uma imagem contendo todas as ferramentas necessárias

**Decisão:**
Usar Docker para isolar o ambiente de execução dentro de um container.

**Consequências:**
- Positivo: ambiente reproduzível em qualquer máquina com Docker instalado
- Positivo: sem risco de conflito de versões entre projetos
- Negativo: exige Docker instalado e conhecimento básico de containers


## Decisão 2 — Construir ambiente dev e prod

**Status:** Ativo

**Contexto:**
O projeto tem como foco aplicar IaC de uma maneira que possa ser replicada em ambiente corporativo

**Alternativas consideradas:**
- Criar um único ambiente
- Criar environments para reproduzir um ambiente de desenvolvimento e um de produção

**Decisão:**
- Criar um ambiente que simulasse o ambiente corporativo com environments diferentes 

**Consequências:**
- Positivo: Ambiente para testes e desenvolvimente que não afeta a produção
- Positivo: Similaridade com o mundo real
- Negativo: Precisa de maior esforço de manutenção - alterações precisar ser aplicadas e validadas em ambos ambientes


## Decisão 3 — Localidade dos recursos

**Status:** Ativo

**Contexto:**
Ao provisionar recursos na Azure é necessário definir uma região. 
A escolha inicial foi eastus por ser uma das regiões mais completas, 
porém durante o provisionamento a região apresentou alta demanda e 
restrições para contas free tier.

**Alternativas consideradas:**
- usar location eastus
- usar uma location mais perto como brazilsouth 

**Decisão:**
- A princípio a decisão era usar location eastus mas devido a sua alta demanda foi aplicado brazilsouth 

**Consequências:**
- Positivo: Servidores menos lotado e mais perto 
- Negativo: Não é de primeira linha - pode conter alguns recursos indisponíveis




