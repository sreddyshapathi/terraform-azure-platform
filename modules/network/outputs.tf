output "vnet_id" {
  value = azurerm_virtual_network.myvnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}

output "management_subnet_id" {
  value = azurerm_subnet.management.id
}