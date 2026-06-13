resource "azurerm_container_registry" "devacr" {

  name                = "acr${var.environment}${var.project_name}${var.name_suffix}"

  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = false

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}