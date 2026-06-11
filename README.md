# Azure Enterprise Platform using Terraform

## Overview

This project demonstrates the design and deployment of an enterprise-grade Azure platform using Terraform.

The goal is to build a reusable, scalable, and production-ready Azure landing zone that supports Kubernetes workloads, secure networking, centralized identity management, monitoring, and automation.

---

## Project Objectives

* Infrastructure as Code using Terraform
* Environment segregation (Development and Production)
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Azure Key Vault Integration
* Azure Storage Accounts
* RBAC and Identity Management
* Monitoring and Alerting
* GitHub Actions CI/CD
* Secure Terraform State Management

---

## Target Architecture

```text
Developer
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ▼
Terraform
    │
    ▼
Azure Subscription
    │
    ├── Resource Groups
    ├── Virtual Networks
    ├── Network Security Groups
    ├── Storage Accounts
    ├── Key Vault
    ├── Azure Container Registry
    ├── Azure Kubernetes Service
    ├── Monitoring
    └── Alerts
```

---

## Repository Structure

```text
terraform-azure-platform/
│
├── docs/
├── diagrams/
│
├── modules/
│   ├── resource_group/
│   ├── network/
│   ├── storage/
│   ├── keyvault/
│   ├── acr/
│   ├── aks/
│   ├── iam/
│   ├── monitoring/
│   ├── security/
│   └── alerts/
│
├── environments/
│   ├── dev/
│   └── prod/
│
└── README.md
```

---

## Environments

### Development

Used for infrastructure validation and testing.

### Production

Used for production workloads and business applications.

---

## Implemented Components

### Phase 1

* [x] GitHub Repository
* [x] Local Development Environment
* [x] Azure Authentication
* [x] Resource Group Module
* [x] Resource Group Deployment

### Phase 2

* [ ] Virtual Network
* [ ] Subnets
* [ ] Network Security Groups

### Phase 3

* [ ] IAM and RBAC
* [ ] Azure AD Groups

### Phase 4

* [ ] Storage Accounts
* [ ] Azure Key Vault

### Phase 5

* [ ] Azure Container Registry
* [ ] Azure Kubernetes Service

### Phase 6

* [ ] Monitoring
* [ ] Azure Monitor
* [ ] Log Analytics
* [ ] Alerts

### Phase 7

* [ ] Prometheus
* [ ] Grafana

### Phase 8

* [ ] Remote Terraform Backend
* [ ] GitHub Actions CI/CD

---

## Local Development Setup

Refer:

```text
docs/01-local-setup.md
```

---

## Documentation

| Document               | Description                          |
| ---------------------- | ------------------------------------ |
| 00-project-overview.md | Project Overview                     |
| 01-local-setup.md      | Local Environment Setup              |
| 02-resource-groups.md  | Resource Group Design and Deployment |
| 03-networking.md       | Network Architecture                 |
| 04-iam-rbac.md         | IAM and RBAC                         |
| 05-storage.md          | Storage Accounts                     |
| 06-keyvault.md         | Key Vault                            |
| 07-acr.md              | Azure Container Registry             |
| 08-aks.md              | Azure Kubernetes Service             |
| 09-monitoring.md       | Monitoring and Alerting              |
| 10-security.md         | Security Controls                    |
| 11-terraform-state.md  | Remote Backend Design                |
| 12-github-actions.md   | CI/CD Pipeline                       |

---

## Current Status

Current Phase:

```text
Phase 1 - Resource Groups
```

Next Phase:

```text
Phase 2 - Networking
```

---

## Author

Sudhakar Reddy

Azure | Terraform | Kubernetes | DevOps
