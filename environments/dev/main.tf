module "resource_group" {
  source = "../../modules/resource_group"

  resource_group_name = "rg-${var.environment}-${var.project_name}"

  location = var.location

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}


module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name

  vnet_cidr                    = var.vnet_cidr
  aks_subnet_cidr              = var.aks_subnet_cidr
  private_endpoint_subnet_cidr = var.private_endpoint_subnet_cidr
  management_subnet_cidr       = var.management_subnet_cidr
}

module "storage" {

  source = "../../modules/storage"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
}


module "keyvault" {

  source = "../../modules/keyvault"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
}


module "acr" {

  source = "../../modules/acr"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
  name_suffix  = var.name_suffix
}



module "aks" {

  source = "../../modules/aks"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name

  aks_subnet_id = module.network.aks_subnet_id
  acr_id = module.acr.acr_id
  keyvault_id = module.keyvault.keyvault_id
  storage_account_id = module.storage.storage_account_id
  log_analytics_workspace_id = module.monitoring.workspace_id
}


module "monitoring" {

  source = "../../modules/monitoring"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name

  alert_email = "sreddyshapathi07@gmail.com"

  aks_id      = module.aks.aks_id
  keyvault_id = module.keyvault.keyvault_id
  acr_id      = module.acr.acr_id
}