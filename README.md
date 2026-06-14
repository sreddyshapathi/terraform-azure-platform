# Azure Cloud Platform Infrastructure as Code using Terraform

## Project Overview

This project demonstrates the deployment of a complete Azure cloud platform using Terraform.

The infrastructure follows Infrastructure as Code (IaC) principles and includes networking, storage, security, container platform, monitoring, and service integrations.

The project is designed to showcase enterprise-grade Azure architecture, Terraform module design, monitoring, security, and AKS integrations.

---

# Architecture

The platform consists of the following Azure services:

* Resource Group
* Virtual Network
* Subnets
* Network Security Groups
* Storage Account
* Azure Key Vault
* Azure Container Registry (ACR)
* Azure Kubernetes Service (AKS)
* Log Analytics Workspace
* Azure Monitor
* Diagnostic Settings
* Action Groups
* Alert Rules

---

# Solution Architecture

GitHub

↓

Terraform

↓

Azure Platform

├── Resource Group

├── Networking

│   ├── Virtual Network

│   ├── AKS Subnet

│   ├── Management Subnet

│   └── Private Endpoint Subnet

│

├── Storage Account

│   └── Blob Containers

│

├── Key Vault

│

├── Azure Container Registry

│

├── Azure Kubernetes Service

│   └── System Node Pool

│

├── Log Analytics Workspace

│

└── Azure Monitor

```
├── Diagnostic Settings

├── Action Groups

└── Alert Rules
```

---

# Features

## Infrastructure as Code

* Modular Terraform design
* Reusable Terraform modules
* Environment-based deployment
* Dev environment support

## Networking

* Virtual Network
* Multiple Subnets
* Network Security Groups
* AKS subnet integration

## Storage

* Azure Storage Account
* Blob Containers
* Secure storage architecture

## Security

* Azure Key Vault
* Managed Identities
* Role-Based Access Control (RBAC)

## Container Platform

* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* AKS to ACR integration

## Monitoring

* Log Analytics Workspace
* Azure Monitor
* Diagnostic Settings
* Action Groups
* Alert Rules

---

# Project Structure

```text
azure-cloud-terraform/
│
├── modules/
│   ├── resource-group/
│   ├── network/
│   ├── storage/
│   ├── keyvault/
│   ├── acr/
│   ├── aks/
│   └── monitoring/
│
├── environments/
│   └── dev/
│
├── docs/
│   ├── 01-resource-group.md
│   ├── 02-networking.md
│   ├── 03-storage.md
│   ├── 04-keyvault.md
│   ├── 05-acr.md
│   ├── 06-aks.md
│   ├── 07-monitoring.md
│   └── 08-integrations.md
│
└── README.md
```

---

# Azure Resources Deployed

| Resource        | Purpose                               |
| --------------- | ------------------------------------- |
| Resource Group  | Logical container for Azure resources |
| Virtual Network | Network isolation                     |
| Subnets         | Workload segmentation                 |
| NSGs            | Network security                      |
| Storage Account | Blob storage                          |
| Key Vault       | Secrets management                    |
| ACR             | Container image repository            |
| AKS             | Managed Kubernetes cluster            |
| Log Analytics   | Centralized logging                   |
| Azure Monitor   | Monitoring and alerting               |

---

# AKS Integrations

## AKS to ACR

Role Assignment:

* AcrPull

Purpose:

Allows AKS to pull container images from Azure Container Registry.

---

## AKS to Key Vault

Role Assignment:

* Key Vault Secrets User

Purpose:

Allows AKS workloads to access secrets stored in Azure Key Vault.

---

## AKS to Storage

Role Assignment:

* Storage Blob Data Contributor

Purpose:

Allows AKS workloads to access Azure Storage resources.

---

## AKS to Log Analytics

Role Assignment:

* Log Analytics Reader

Purpose:

Allows AKS workloads to access monitoring resources.

---

# Monitoring Configuration

## Log Analytics Workspace

Centralized repository for logs and metrics.

## Diagnostic Settings

Configured for:

* AKS
* Azure Container Registry
* Key Vault

## Azure Monitor

Configured with:

* Action Groups
* Alert Rules
* Centralized Monitoring

---

# Validation Commands

## Terraform

```bash
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

## AKS

```bash
az aks get-credentials \
  --resource-group rg-dev-platform \
  --name aks-dev-platform
```

```bash
kubectl get nodes
```

```bash
kubectl get pods -A
```

## Azure Resources

```bash
az group list
```

```bash
az aks list
```

```bash
az acr list
```

```bash
az keyvault list
```

---

# Documentation

Detailed implementation documentation is available in the docs folder.

| Document             | Description                   |
| -------------------- | ----------------------------- |
| 01-resource-group.md | Resource Group deployment     |
| 02-networking.md     | Networking architecture       |
| 03-storage.md        | Storage Account configuration |
| 04-keyvault.md       | Key Vault deployment          |
| 05-acr.md            | Azure Container Registry      |
| 06-aks.md            | Azure Kubernetes Service      |
| 07-monitoring.md     | Monitoring and Alerting       |
| 08-integrations.md   | Service Integrations          |

---

# Future Enhancements

The following enhancements are planned:

* Workload Identity
* Secrets Store CSI Driver
* Persistent Volumes
* Persistent Volume Claims
* Prometheus
* Grafana
* GitHub Actions CI/CD
* Terraform Remote Backend
* OIDC Authentication

---

# Learning Outcomes

This project demonstrates:

* Azure Infrastructure as Code
* Terraform Module Design
* Azure Networking
* Azure Security
* AKS Deployment
* Azure Monitoring
* Azure RBAC
* Azure Service Integrations
* Cloud Platform Engineering

---

# Author

Sudhakar Reddy

Azure Cloud Platform using Terraform
