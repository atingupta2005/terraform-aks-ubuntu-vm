# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}          
}



