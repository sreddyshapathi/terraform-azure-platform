resource "azurerm_log_analytics_workspace" "devlog" {

  name = "law-${var.environment}-${var.project_name}-srs"

  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}