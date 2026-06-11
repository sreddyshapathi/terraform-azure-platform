output "storage_account_name" {
  value = azurerm_storage_account.devsta.name
}

output "storage_account_id" {
  value = azurerm_storage_account.devsta.id
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.devsta.primary_blob_endpoint
}