data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "devkeyvault" {

  name                = "kvtd-${var.environment}-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  enable_rbac_authorization = true

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}