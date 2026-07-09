terraform {
  required_version = ">= 1.5.0"             # Requires Terraform CLI version 1.5.0 or later.

  required_providers { 
    azurerm = { 
    source = "hashicorp/azurerm" 
    version = "~> 4.0"                      # Uses the latest compatible 4.x version.,It will not automatically upgrade to 5.x.
   }
  }
}

provider "azurerm" { 
    features {} 
}