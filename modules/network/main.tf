resource "azurerm_virtual_network" "myvnet" {
  name                = "vnet-${var.environment}-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.vnet_cidr]

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}



resource "azurerm_subnet" "aks" {
  name                 = "snet-${var.environment}-aks"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet.name

  address_prefixes = [var.aks_subnet_cidr]
}

resource "azurerm_subnet" "private_endpoint" {
  name                 = "snet-${var.environment}-private-endpoint"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet.name

  address_prefixes = [var.private_endpoint_subnet_cidr]
}


resource "azurerm_subnet" "management" {
  name                 = "snet-${var.environment}-management"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet.name

  address_prefixes = [var.management_subnet_cidr]
}

resource "azurerm_network_security_group" "aks" {
  name                = "nsg-${var.environment}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_security_group" "private_endpoint" {
  name                = "nsg-${var.environment}-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "management" {
  name                = "nsg-${var.environment}-management"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id                 = azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}

resource "azurerm_subnet_network_security_group_association" "private_endpoint" {
  subnet_id                 = azurerm_subnet.private_endpoint.id
  network_security_group_id = azurerm_network_security_group.private_endpoint.id
}

resource "azurerm_subnet_network_security_group_association" "management" {
  subnet_id                 = azurerm_subnet.management.id
  network_security_group_id = azurerm_network_security_group.management.id
}