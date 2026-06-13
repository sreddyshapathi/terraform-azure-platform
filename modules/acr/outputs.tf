output "acr_name" {
  value = azurerm_container_registry.devacr.name
}

output "acr_id" {
  value = azurerm_container_registry.devacr.id
}

output "login_server" {
  value = azurerm_container_registry.devacr.login_server
}