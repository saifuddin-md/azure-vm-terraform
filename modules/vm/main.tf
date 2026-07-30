resource "azurerm_linux_virtual_machine" "proj_demo" {

  name                = "ubuntu-vm"
  location            = var.location
  resource_group_name = var.resource_group_name

  size = "Standard_F2"

  admin_username = "azureuser"

  disable_password_authentication = true

  admin_ssh_key {

    username   = "azureuser"
    public_key = file(var.public_key_path)
  }

  network_interface_ids = [
    var.nic_id
  ]

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    publisher = "Canonical"

    offer = "0001-com-ubuntu-server-jammy"

    sku = "22_04-lts"

    version = "latest"
  }
}