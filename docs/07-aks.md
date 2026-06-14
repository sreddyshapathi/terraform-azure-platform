# Azure Kubernetes Service (AKS)

## Overview

Azure Kubernetes Service (AKS) is a managed Kubernetes platform used to deploy, manage, and scale containerized applications.

## Objective

The objective of this deployment is to provision a secure and scalable Kubernetes cluster integrated with existing Azure infrastructure components.

## Resources Created

* AKS Cluster
* System Node Pool
* Managed Identity
* Azure CNI Overlay Networking
* Integration with existing Virtual Network and Subnet

## Configuration

| Property       | Value             |
| -------------- | ----------------- |
| Cluster Name   | aks-dev-platform  |
| SKU Tier       | Free              |
| Node Pool Type | System            |
| Node Count     | 1                 |
| VM Size        | Standard_D2s_v3   |
| Network Plugin | Azure CNI Overlay |

## Network Integration

AKS was deployed into the existing AKS subnet within the virtual network.

AKS Subnet:

* snet-dev-aks

## Validation

```bash
az aks get-credentials --resource-group rg-dev-platform --name aks-dev-platform

kubectl get nodes

kubectl get pods -A
```


## Benefits

* Managed Kubernetes platform
* Automatic cluster management
* Azure-native networking
* Integration with Azure services
* Enterprise-grade scalability
