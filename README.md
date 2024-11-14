# Terragrunt Container Image

This repository contains a Docker image designed to provide a ready-to-use environment for Terragrunt, Terraform and Azure CLI. It is optimized for use in CI/CD pipelines where infrastructure as code (IaC) is required.

## Table of Contents
- [Terragrunt Container Image](#terragrunt-container-image)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Usage in pipelines](#usage-in-pipelines)
  - [Building locally](#building-locally)

---

## Overview

This image simplifies the setup needed for deploying infrastructure on cloud providers using **Terragrunt** and **Terraform**. With built-in **Azure CLI**, it also supports deployments and configurations within Azure environments.

## Features

- **Terragrunt**: The main tool for infrastructure deployment.
- **Terraform**: Included as a dependency for Terragrunt.
- **Azure CLI**: Configured and ready for managing Azure resources.
- **AWS CLI**: Configured and ready for managing AWS resources.
  
## Usage in pipelines

```yaml
name: Terragrunt CI

on: [push]

jobs:
  terragrunt-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run Terragrunt plan
        run: |
          docker run --rm -v ${{ github.workspace }}:/workspace moabukar/terragrunt-image terragrunt plan
```

## Building locally

```bash
docker build -t moabukar/terragrunt-image:latest .

docker run --rm -v $PWD:/workspace moabukar/terragrunt-image terragrunt plan
```
