resource "azurerm_monitor_metric_alert" "keyvault_availability" {

  name                = "keyvault-availability"
  resource_group_name = var.resource_group_name

  scopes = [
    var.keyvault_id
  ]

  severity = 2

  frequency   = "PT5M"
  window_size = "PT15M"

  criteria {

    metric_namespace = "Microsoft.KeyVault/vaults"

    metric_name = "Availability"

    aggregation = "Average"

    operator = "LessThan"

    threshold = 99
  }

  action {
    action_group_id = var.action_group_id
  }
}