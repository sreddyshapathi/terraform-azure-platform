# Azure Key Vault Architecture

## Overview

This document describes the Azure Key Vault implementation for the Azure Enterprise Platform project.

Azure Key Vault provides centralized secret management and secure storage for sensitive information used by infrastructure and applications.

The Key Vault will later integrate with Azure Kubernetes Service (AKS), GitHub Actions, Storage Accounts, and application workloads.

---

# Objectives

The Key Vault implementation supports:

* Secure Secret Management
* Centralized Credential Storage
* AKS Secret Integration
* Application Configuration Management
* Certificate Storage
* Future Managed Identity Integration

---

# Architecture

```text
rg-dev-platform
│
├── stdevplatform001
│
└── kv-dev-platform
```

---

# Resource Deployed

## Azure Key Vault

Resource Name:

```text
kv-dev-platform
```

Purpose:

* Store secrets securely
* Store certificates
* Centralized secret management
* Support future AKS integration

---

# Configuration

| Setting             | Value     |
| ------------------- | --------- |
| SKU                 | Standard  |
| Soft Delete         | Enabled   |
| Purge Protection    | Enabled   |
| Authorization Model | RBAC      |
| Managed By          | Terraform |

---

# Security Features

## Soft Delete

Provides recovery capabilities if secrets or the vault are accidentally deleted.

Retention Period:

```text
7 Days
```

---

## Purge Protection

Prevents permanent deletion of the Key Vault until the retention period expires.

Benefits:

* Protection against accidental deletion
* Protection against malicious deletion
* Improved compliance

---

## RBAC Authorization

Role-Based Access Control is enabled.

Benefits:

* Centralized access management
* Azure-native authorization
* Better integration with AKS and Managed Identities

---

# Terraform Module

Module Location:

```text
modules/keyvault
```

Resources Created:

* Azure Key Vault

---

# Deployment Commands

Initialize Terraform:

```bash
terraform init
```

Validate Configuration:

```bash
terraform validate
```

Generate Execution Plan:

```bash
terraform plan
```

Deploy Resources:

```bash
terraform apply
```

---

# Validation

Verify Key Vault:

```bash
az keyvault list --output table
```

Expected:

```text
kv-dev-platform
```

---

# Sample Secret

Example Secret:

```text
sample-secret
```

Purpose:

Used for validation and demonstration purposes.

---

# Screenshots

## Key Vault Overview

Add Azure Portal screenshot.

## Secrets

Add Azure Portal screenshot.

## Access Configuration

Add Azure Portal screenshot.

## RBAC Settings

Add Azure Portal screenshot.





# Conclusion

Azure Key Vault provides the secure secret management foundation for the Azure Enterprise Platform and prepares the environment for AKS, application, and automation integrations.
