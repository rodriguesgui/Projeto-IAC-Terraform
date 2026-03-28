# Makefile — projeto-iac
# Atalhos para build, execução e gerenciamento do container

IMAGE_NAME=projeto-iac
IAC_PATH=$(PWD)/IaC


# 1 - Constrói a imagem Docker do projeto

build:
	docker build -t $(IMAGE_NAME) .


# 2 - Inicia o container em modo interativo montando a pasta IaC
run:
	docker run -it --rm \
		-v $(IAC_PATH):/IaC \
		$(IMAGE_NAME)


# 3 - Constrói a imagem e inicia o container em sequência
start: build run

# 4 - Remove a imagem Docker local
clean:
	docker rmi $(IMAGE_NAME)

# 5 - Lista imagens e containers relacionados ao projeto
status:
	docker images | grep $(IMAGE_NAME)
	docker ps -a | grep $(IMAGE_NAME)

.PHONY: build run start clean status