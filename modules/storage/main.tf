/*resource "azurerm_storage_account" "devsta" {

  name                = "st${var.environment}${var.project_name}001"
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  account_kind = "StorageV2"

  https_traffic_only_enabled = true

  min_tls_version = "TLS1_2"

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}*/
/*resource "azurerm_storage_container" "terraform_state" {

  name = "terraform-state"

  storage_account_id = azurerm_storage_account.devsta.id

  container_access_type = "private"
}*/


/*resource "azurerm_storage_container" "application_data" {

  name = "application-data"

  storage_account_id = azurerm_storage_account.devsta.id

  container_access_type = "private"
}*/
