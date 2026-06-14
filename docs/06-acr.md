# Azure Container Registry (ACR)

## Overview

This document describes the Azure Container Registry (ACR) implementation for the Azure Enterprise Platform project.

Azure Container Registry provides a private container image repository that will be used by Azure Kubernetes Service (AKS), CI/CD pipelines, and future application workloads.

The registry serves as the centralized location for storing, managing, and distributing container images within the Azure platform.

---

# Objectives

The Azure Container Registry implementation supports:

* Private Docker Image Storage
* Secure Image Distribution
* AKS Integration
* CI/CD Pipeline Integration
* Container Lifecycle Management
* Enterprise Container Platform Architecture

---

# Architecture

```text
Developer
    │
docker build
    │
docker push
    │
    ▼
Azure Container Registry
    │
    ▼
Azure Kubernetes Service
```

---

# Resource Deployed

## Azure Container Registry

Resource Name:

```text
acrdevplatformsrs
```

Purpose:

* Store Docker images
* Store application artifacts
* Centralized image repository
* Provide images to AKS clusters
* Support future GitHub Actions deployments

---

# Configuration

| Setting        | Value      |
| -------------- | ---------- |
| SKU            | Basic      |
| Admin User     | Disabled   |
| Authentication | Azure RBAC |
| Managed By     | Terraform  |

---

# Why ACR is Required

Azure Kubernetes Service does not store application container images.

Container images must be stored in a registry.

The standard Azure architecture is:

```text
Developer
 │
docker build
 │
docker push
 │
 ▼
Azure Container Registry
 │
 ▼
AKS Cluster
```

Benefits:

* Private image storage
* Secure image distribution
* Native Azure integration
* Simplified AKS deployments

---

# Security Features

Current Security Controls:

* Private Registry
* Azure Authentication
* Admin User Disabled
* Terraform Managed Deployment

Future Security Enhancements:

* Private Endpoint
* Network Restrictions
* AKS Managed Identity Access
* Microsoft Defender for Containers
* Image Vulnerability Scanning

---

# Terraform Module

Module Location:

```text
modules/acr
```

Resources Created:

* Azure Container Registry

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

Verify Registry:

```bash
az acr list --output table
```

Expected Output:

```text
acrdevplatformsrs
```

Verify Registry Details:

```bash
az acr show \
  --name acrdevplatformsrs \
  --output table
```

Verify Login:

```bash
az acr login \
  --name acrdevplatformsrs
```

---

# Future Usage

The registry will be used to store:

* Application Images
* Microservices Images
* Utility Containers
* Monitoring Containers
* Platform Components

Example Workflow:

```text
docker build
       │
       ▼
docker tag
       │
       ▼
docker push
       │
       ▼
Azure Container Registry
       │
       ▼
AKS Pulls Image
```


# Benefits

Key advantages of Azure Container Registry:

* Fully Managed Service
* Private Image Storage
* Azure Native Integration
* AKS Ready
* Enterprise Security Support
* CI/CD Integration Support

---


# Conclusion

Azure Container Registry provides the container image management foundation for the Azure Enterprise Platform. It enables secure image storage and distribution and prepares the environment for AKS, GitHub Actions, and application deployment workflows.
