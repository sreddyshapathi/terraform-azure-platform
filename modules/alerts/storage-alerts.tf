resource "azurerm_monitor_metric_alert" "storage_availability" {

  name                = "storage-availability"
  resource_group_name = var.resource_group_name

  scopes = [
    var.storage_account_id
  ]

  frequency   = "PT5M"
  window_size = "PT15M"

  severity = 2

  criteria {

    metric_namespace = "Microsoft.Storage/storageAccounts"

    metric_name = "Availability"

    aggregation = "Average"

    operator = "LessThan"

    threshold = 99
  }

  action {
    action_group_id = var.action_group_id
  }
}