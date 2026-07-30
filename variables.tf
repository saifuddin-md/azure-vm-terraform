variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "public_key_path" {
  description = "The path to the SSH public key file"
  type        = string
}
