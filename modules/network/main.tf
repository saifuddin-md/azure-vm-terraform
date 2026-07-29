resource "azurerm_virtual_network" "proj_demo" {
  name                = "dev-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "proj_demo" {
  name                 = "public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.proj_demo.name

  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "proj_demo" {
  name                = "vm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
}

resource "azurerm_network_security_group" "proj_demo" {

  name                = "vm-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "proj_demo" {

  name                = "vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = azurerm_subnet.proj_demo.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.proj_demo.id
  }
}

resource "azurerm_network_interface_security_group_association" "proj_demo" {

  network_interface_id      = azurerm_network_interface.proj_demo.id
  network_security_group_id = azurerm_network_security_group.proj_demo.id
}