# Resource Groups

## Purpose

Resource Groups provide logical containers for Azure resources.

For this project, Resource Groups are used to separate environments and simplify resource management, access control, monitoring, and lifecycle operations.

---

## Design

### Development Environment

```text
rg-dev-platform
```

### Future Production Environment

```text
rg-prod-platform
```

---

## Terraform Module

Module Location:

```text
modules/resource_group
```

Resources Created:

* Azure Resource Group

---

## Configuration

### Variables

| Variable            | Description                |
| ------------------- | -------------------------- |
| resource_group_name | Name of the Resource Group |
| location            | Azure Region               |
| tags                | Resource Tags              |

---

## Tags

The following tags are applied:

| Tag         | Value     |
| ----------- | --------- |
| Environment | dev       |
| Project     | platform  |
| ManagedBy   | Terraform |

---

## Deployment

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

Deploy Infrastructure:

```bash
terraform apply
```

---

## Validation

Verify Resource Group creation:

```bash
az group list --output table
```

Expected Resource Group:

```text
rg-dev-platform
```

