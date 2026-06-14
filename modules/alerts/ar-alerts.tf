resource "azurerm_monitor_metric_alert" "acr_availability" {

  name                = "acr-availability"
  resource_group_name = var.resource_group_name

  scopes = [
    var.acr_id
  ]

  severity = 2

  frequency   = "PT5M"
  window_size = "PT15M"

  criteria {

    metric_namespace = "Microsoft.ContainerRegistry/registries"

    metric_name = "SuccessfulPullCount"

    aggregation = "Total"

    operator = "LessThan"

    threshold = 1
  }

  action {
    action_group_id = var.action_group_id
  }
}