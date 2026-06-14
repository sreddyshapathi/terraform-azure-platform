# Azure Service Integrations

## Overview

The platform integrates AKS with multiple Azure services using Azure RBAC and Managed Identities.

---

## AKS to ACR Integration

### Purpose

Allows AKS to pull container images from Azure Container Registry.

### Implementation

Role Assignment:

* AcrPull

### Flow

AKS
↓
Managed Identity
↓
AcrPull Role
↓
Azure Container Registry

---

## AKS to Key Vault Integration

### Purpose

Allows AKS workloads to securely access secrets stored in Azure Key Vault.

### Implementation

Role Assignment:

* Key Vault Secrets User

### Flow

AKS
↓
Managed Identity
↓
Key Vault Secrets User
↓
Azure Key Vault

---

## AKS to Storage Integration

### Purpose

Allows AKS workloads to access Azure Storage resources.

### Implementation

Role Assignment:

* Storage Blob Data Contributor

### Flow

AKS
↓
Managed Identity
↓
Storage Blob Data Contributor
↓
Azure Storage Account

---

## AKS to Log Analytics Integration

### Purpose

Allows AKS to access monitoring and logging resources.

### Implementation

Role Assignment:

* Log Analytics Reader

### Flow

AKS
↓
Managed Identity
↓
Log Analytics Reader
↓
Log Analytics Workspace

---

## Benefits

* Passwordless authentication
* Azure RBAC integration
* Managed identity security
* Centralized access control
* Enterprise-grade architecture


