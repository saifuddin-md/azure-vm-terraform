resource "azurerm_resource_group" "proj_demo" {

  name     = var.rg_name
  location = var.rg_location
}