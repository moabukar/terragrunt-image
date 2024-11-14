FROM alpine:latest

RUN apk update && apk add --no-cache \
    git \
    python3 \
    py3-pip \
    python3-dev \
    py3-virtualenv \  
    wget \
    unzip \
    curl \
    gcc \
    libffi-dev \
    musl-dev \
    openssl-dev \
    make

RUN python3 -m virtualenv /azure-cli-env

ENV PATH="/azure-cli-env/bin:$PATH"

# AWS & Azure CLI
RUN pip install --no-cache-dir awscli
RUN pip install azure-cli

# Terraform
ARG TERRAFORM_VERSION=1.8.1
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Terragrunt
ARG TERRAGRUNT_VERSION=0.57.3
RUN wget -q -O terragrunt_linux_amd64 https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN apk del gcc libffi-dev musl-dev openssl-dev python3-dev make

WORKDIR /cicd
