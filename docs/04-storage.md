# Storage Account Architecture

## Overview

This document describes the Azure Storage Account implementation for the Azure Enterprise Platform project.

The Storage Account provides centralized storage services for platform resources and future application workloads.

The initial implementation focuses on creating a secure and scalable storage foundation that will later integrate with Azure Kubernetes Service (AKS), Azure Key Vault, monitoring services, and Terraform remote state management.

---

# Objectives

The Storage Account is deployed to support:

* Terraform Remote State Storage
* Application Data Storage
* Future AKS Persistent Storage
* Log and Backup Storage
* Secure Platform Storage Services

---

# Architecture

```text
rg-dev-platform
│
└── stdevplatform001
      │
      ├── terraform-state
      └── application-data
```

---

# Resources Deployed

## Storage Account

Resource Name:

```text
stdevplatform001
```

Purpose:

* Central storage service
* Blob storage platform
* Future Terraform backend
* Future application storage

Configuration:

| Setting             | Value     |
| ------------------- | --------- |
| Account Kind        | StorageV2 |
| Performance         | Standard  |
| Replication         | LRS       |
| HTTPS Only          | Enabled   |
| Minimum TLS Version | TLS 1.2   |

---

## Terraform State Container

Container Name:

```text
terraform-state
```

Purpose:

Stores Terraform state files when the project is migrated from local state to a remote backend.

Benefits:

* Centralized state management
* Team collaboration support
* State locking support
* Improved reliability

---

## Application Data Container

Container Name:

```text
application-data
```

Purpose:

Stores application files and platform data.

Future use cases:

* Application uploads
* Backup files
* AKS workload storage
* Log archival

---

# Security Configuration

Current Security Controls:

* HTTPS Traffic Only
* TLS 1.2 Minimum Version
* Private Blob Containers
* Terraform Managed Resources

Future Security Enhancements:

* Private Endpoint Integration
* RBAC Authorization
* Managed Identity Access
* Network Rules
* Private DNS Integration

---

# Terraform Module

Module Location:

```text
modules/storage
```

Resources Created:

* Azure Storage Account
* Terraform State Container
* Application Data Container

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

Verify Storage Accounts:

```bash
az storage account list --output table
```

Verify Blob Containers:

```bash
az storage container list \
--account-name stdevplatform001 \
--auth-mode login \
--output table
```

Expected Containers:

```text
terraform-state
application-data
```


The Storage Account will serve as a foundational platform component supporting application workloads and infrastructure services.

---

# Conclusion

The Storage Account implementation establishes the platform storage foundation and prepares the environment for future integrations with AKS, Key Vault, monitoring services, and remote Terraform state management.
