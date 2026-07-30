output "subnet_id" {
  value = azurerm_subnet.proj_demo.id
}

output "nic_id" {
  value = azurerm_network_interface.proj_demo.id
}

output "public_ip" {
  value = azurerm_public_ip.proj_demo.ip_address
}