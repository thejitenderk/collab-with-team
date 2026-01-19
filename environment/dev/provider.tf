terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dnd-win-rg"            # Resource group ka naam jahan storage account hai
    storage_account_name = "tfstatestgforeveryone" # Storage account ka naam
    container_name       = "tfstatecont"           # Blob container ka naam
    key                  = "dev.terraform.tfstate" # State file ka naam
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8432b329-2a25-4ccb-9771-c72ad6d864df"
}
