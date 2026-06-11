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