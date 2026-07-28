module "resource_group" {
  source = "./modules/resource-group"

  rg_name     = var.resource_group_name
  rg_location = var.location
}