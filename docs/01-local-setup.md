# Local Development Environment Setup

## Purpose

This document describes the local development environment required to build and deploy the Azure Enterprise Platform using Terraform.

---

## Development Environment

| Component              | Value              |
| ---------------------- | ------------------ |
| Operating System       | macOS              |
| IDE                    | Visual Studio Code |
| Source Control         | GitHub             |
| Authentication         | GitHub SSH         |
| Cloud Platform         | Microsoft Azure    |
| Infrastructure as Code | Terraform          |

---

# Required Tools

## Homebrew

Package manager for macOS.

### Verify

```bash
brew --version
```

### Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## Git

Source control management.

### Install

```bash
brew install git
```

### Verify

```bash
git --version
```

---

## Terraform

Infrastructure as Code tool used for Azure resource provisioning.

### Install

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### Verify

```bash
terraform version
```

---

## Azure CLI

Azure management and authentication tool.

### Install

```bash
brew install azure-cli
```

### Verify

```bash
az version
```

### Login

```bash
az login
```

### Verify Subscription

```bash
az account show --output table
```

---

## Visual Studio Code

Primary development environment.

### Install

```bash
brew install --cask visual-studio-code
```

### Verify

```bash
code --version
```

---

## Docker Desktop

Required for container testing and Kubernetes tooling.

### Install

```bash
brew install --cask docker
```

### Verify

```bash
docker version
```

```bash
docker ps
```

---

## kubectl

Kubernetes command line utility.

### Install

```bash
brew install kubectl
```

### Verify

```bash
kubectl version --client
```

---

## Helm

Kubernetes package manager.

### Install

```bash
brew install helm
```

### Verify

```bash
helm version
```

---

## Minikube

Local Kubernetes cluster for testing.

### Install

```bash
brew install minikube
```

### Verify

```bash
minikube version
```

### Start Cluster

```bash
minikube start
```

### Check Nodes

```bash
kubectl get nodes
```

### Stop Cluster

```bash
minikube stop
```

---

## jq

JSON processing utility.

### Install

```bash
brew install jq
```

### Verify

```bash
jq --version
```

---

## tree

Directory structure visualization utility.

### Install

```bash
brew install tree
```

### Verify

```bash
tree --version
```

---

# GitHub SSH Authentication

### Generate SSH Key

```bash
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "sudhakarreddy0145@gmail.com"
```

### Display Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

### Test SSH Connectivity

```bash
ssh -T git@github.com
```

Expected Output:

```text
Hi sreddyshapathi! You've successfully authenticated.
```

---

# Verification Checklist

* [ ] Homebrew Installed
* [ ] Git Installed
* [ ] Terraform Installed
* [ ] Azure CLI Installed
* [ ] VS Code Installed
* [ ] Docker Desktop Installed
* [ ] kubectl Installed
* [ ] Helm Installed
* [ ] Minikube Installed
* [ ] jq Installed
* [ ] tree Installed
* [ ] GitHub SSH Configured
* [ ] Azure Login Successful

---

# Notes

* Terraform state will initially be maintained locally.
* Remote backend migration will be implemented later using Azure Storage Account.
* Infrastructure deployments will initially be executed from the local workstation.
* GitHub Actions will be implemented in a later phase for CI/CD automation.
