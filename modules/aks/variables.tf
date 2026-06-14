variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "aks_subnet_id" {
  type = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "keyvault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "storage_account_id" {
  type = string
}


variable "log_analytics_workspace_id" {
  type = string
}