output "keyvault_name" {
  value = azurerm_key_vault.devkeyvault.name
}

output "keyvault_id" {
  value = azurerm_key_vault.devkeyvault.id
}

output "vault_uri" {
  value = azurerm_key_vault.devkeyvault.vault_uri
}