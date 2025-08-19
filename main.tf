terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = "CloudGuruLabMigrateStatetoCloud"
    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-096c0557-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage2" {
  source               = "app.terraform.io/CloudGuruLabMigrateStatetoCloud/securestorage2/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storage1983985"
}