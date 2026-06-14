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


resource "azurerm_monitor_action_group" "devact" {

  name                = "ag-${var.environment}-${var.project_name}"
  resource_group_name = var.resource_group_name
  short_name          = "platform"

  email_receiver {
    name                    = "admin"
    email_address           = var.alert_email
    use_common_alert_schema = true
  }
}

/*resource "azurerm_monitor_diagnostic_setting" "storage" {

  name                       = "storage-diagnostics"

  target_resource_id         = var.storage_account_id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.devlog.id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }
}*/
resource "azurerm_monitor_diagnostic_setting" "keyvault" {

  name                       = "keyvault-diagnostics"

  target_resource_id         = var.keyvault_id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.devlog.id

  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "acr" {

  name                       = "acr-diagnostics"

  target_resource_id         = var.acr_id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.devlog.id

  enabled_log {
    category = "ContainerRegistryRepositoryEvents"
  }

  enabled_log {
    category = "ContainerRegistryLoginEvents"
  }

  metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "aks" {

  name                       = "aks-diagnostics"

  target_resource_id         = var.aks_id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.devlog.id

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-audit"
  }

  enabled_log {
    category = "cluster-autoscaler"
  }

  metric {
    category = "AllMetrics"
  }
}