# Networking Architecture

## Overview

This document describes the networking architecture used for the Azure Enterprise Platform.

The networking layer provides the foundation for all platform services including Azure Kubernetes Service (AKS), Azure Key Vault, Azure Storage Accounts, Azure Container Registry (ACR), monitoring components, and future application workloads.

The objective is to create a secure, scalable, and reusable network architecture that can be deployed consistently across Development and Production environments.

---

# Design Principles

The networking architecture follows the following principles:

* Environment isolation
* Secure communication between Azure services
* Support for Private Endpoints
* AKS-ready subnet design
* Reusable Terraform modules
* Production-ready IP addressing strategy

---

# Development Environment Architecture

```text
rg-dev-platform
│
└── vnet-dev-platform (10.10.0.0/16)
    │
    ├── snet-dev-aks
    │      └── nsg-dev-aks
    │
    ├── snet-dev-private-endpoint
    │      └── nsg-dev-private-endpoint
    │
    └── snet-dev-management
           └── nsg-dev-management
```

---

# Resource Details

## Virtual Network

Resource Name:

```text
vnet-dev-platform
```

Address Space:

```text
10.10.0.0/16
```

Purpose:

* Provides private network connectivity
* Hosts all platform subnets
* Enables communication between Azure services
* Supports future VNet peering and hybrid connectivity

---

## AKS Subnet

Resource Name:

```text
snet-dev-aks
```

Address Space:

```text
10.10.1.0/24
```

Purpose:

This subnet is reserved for Azure Kubernetes Service.

Future resources:

* AKS Cluster
* AKS Node Pools
* Kubernetes Pods
* Kubernetes Services

Benefits:

* Dedicated subnet for Kubernetes workloads
* Simplified network management
* Future scalability

---

## Private Endpoint Subnet

Resource Name:

```text
snet-dev-private-endpoint
```

Address Space:

```text
10.10.2.0/24
```

Purpose:

This subnet is reserved for Azure Private Endpoints.

Future integrations:

* Azure Key Vault
* Azure Storage Account
* Azure Container Registry
* Azure Monitor Private Links

Benefits:

* Private connectivity
* Reduced public exposure
* Improved security posture

---

## Management Subnet

Resource Name:

```text
snet-dev-management
```

Address Space:

```text
10.10.3.0/24
```

Purpose:

Reserved for management resources.

Future resources:

* Azure Bastion
* Jumpbox VM
* Administrative tools
* Troubleshooting resources

Benefits:

* Separation of management traffic
* Secure administrative access

---

# Network Security Groups

Network Security Groups provide traffic filtering and access control for Azure subnets.

---

## AKS NSG

Resource Name:

```text
nsg-dev-aks
```

Purpose:

Controls traffic entering and leaving the AKS subnet.

Future rules may include:

* AKS ingress traffic
* AKS egress restrictions
* Application access controls

---

## Private Endpoint NSG

Resource Name:

```text
nsg-dev-private-endpoint
```

Purpose:

Controls traffic associated with private endpoint resources.

Future rules may include:

* Key Vault access
* Storage Account access
* Container Registry access

---

## Management NSG

Resource Name:

```text
nsg-dev-management
```

Purpose:

Controls administrative traffic.

Future rules may include:

* Bastion access
* SSH access
* RDP access
* Administrative network restrictions

---

# Network Security Group Associations

Each subnet is associated with a dedicated Network Security Group.

Associations:

```text
snet-dev-aks
        │
        ▼
nsg-dev-aks


snet-dev-private-endpoint
        │
        ▼
nsg-dev-private-endpoint


snet-dev-management
        │
        ▼
nsg-dev-management
```

Purpose:

* Enforce subnet-level security
* Centralized traffic control
* Future security rule management

---

# CIDR Allocation Plan

| Resource                | Address Range |
| ----------------------- | ------------- |
| VNet                    | 10.10.0.0/16  |
| AKS Subnet              | 10.10.1.0/24  |
| Private Endpoint Subnet | 10.10.2.0/24  |
| Management Subnet       | 10.10.3.0/24  |

---

# Terraform Module

Module Location:

```text
modules/network
```

Resources Created:

* Virtual Network
* AKS Subnet
* Private Endpoint Subnet
* Management Subnet
* Network Security Groups
* NSG Associations

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

Verify Virtual Network:

```bash
az network vnet list --output table
```

Verify Subnets:

```bash
az network vnet subnet list \
--resource-group rg-dev-platform \
--vnet-name vnet-dev-platform \
--output table
```

Verify Network Security Groups:

```bash
az network nsg list --output table
```




# Conclusion

The networking layer provides the foundational infrastructure required for secure and scalable Azure platform deployments. All future platform services will be integrated into this network architecture using Terraform modules and environment-specific configurations.
