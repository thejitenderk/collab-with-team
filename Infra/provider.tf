terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "real-project-rg"                  # Resource group ka naam jahan storage account hai
    storage_account_name  = "realstorageaccounttf"     # Storage account ka naam
    container_name        = "realcontainer"            # Blob container ka naam
    key                   = "dev.terraform.tfstate"        # State file ka naam
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6427aa49-28ab-4afb-8e17-6f227b30229c"

}
