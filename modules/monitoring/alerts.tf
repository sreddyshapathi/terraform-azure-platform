resource "azurerm_monitor_metric_alert" "aks_cpu" {

  name                = "aks-high-cpu"
  resource_group_name = var.resource_group_name

  scopes = [
    var.aks_id
  ]

  description = "AKS CPU usage above 80%"

  severity    = 2

  frequency   = "PT5M"
  window_size = "PT15M"

  criteria {

    metric_namespace = "Microsoft.ContainerService/managedClusters"

    metric_name = "node_cpu_usage_percentage"

    aggregation = "Average"

    operator  = "GreaterThan"

    threshold = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.devact.id
  }
}


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

    operator  = "LessThan"

    threshold = 99
  }

  action {
    action_group_id = azurerm_monitor_action_group.devact.id
  }
}

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

    operator  = "LessThan"

    threshold = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.devact.id
  }
}