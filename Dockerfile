#1 - Imagem base do Azure CLI — define o sistema operacional e ferramentas base do container
FROM mcr.microsoft.com/azure-cli:latest

#2 - Diretório de trabalho — define a pasta padrão onde os comandos serão executados dentro do container
WORKDIR /IaC

#3 - Versão do Terraform — define qual versão será instalada no container
ENV TERRAFORM_VERSION=1.8.2

#4 - Instalação do Terraform — baixa, descompacta, move para o PATH e limpa arquivos temporários
RUN tdnf install -y unzip wget && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    tdnf clean all

#5 - Comando padrão — define o que executa quando o container é iniciado
CMD ["/bin/bash"]