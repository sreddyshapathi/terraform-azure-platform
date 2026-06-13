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


/*module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name

  vnet_cidr                    = var.vnet_cidr
  aks_subnet_cidr              = var.aks_subnet_cidr
  private_endpoint_subnet_cidr = var.private_endpoint_subnet_cidr
  management_subnet_cidr       = var.management_subnet_cidr
}*/

module "storage" {

  source = "../../modules/storage"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
}


/*module "keyvault" {

  source = "../../modules/keyvault"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
}*/


module "acr" {

  source = "../../modules/acr"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
  name_suffix  = var.name_suffix
}


module "monitoring" {

  source = "../../modules/monitoring"

  resource_group_name = module.resource_group.resource_group_name

  location     = var.location
  environment  = var.environment
  project_name = var.project_name
}