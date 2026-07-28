module "resource_group" {
  source = "./modules/resource-group"

  rg_name     = var.resource_group_name
  rg_location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}