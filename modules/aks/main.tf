resource "azurerm_kubernetes_cluster" "aks" {

  name                = "aks-${var.environment}-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = "aks-${var.environment}"

  sku_tier = "Free"

  default_node_pool {

    name                = "system"

    node_count          = 1

    vm_size             = "Standard_D2s_v3"

    os_disk_size_gb     = 30

    vnet_subnet_id      = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {

    network_plugin      = "azure"

    network_plugin_mode = "overlay"

    network_policy      = "azure"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

# Future User Node Pool
#
# Uncomment when application workloads need dedicated nodes
#

/*
resource "azurerm_kubernetes_cluster_node_pool" "userpool" {

  name                  = "user"

  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  vm_size               = "Standard_B2s"

  node_count            = 1

  mode                  = "User"

  vnet_subnet_id        = var.aks_subnet_id

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
*/