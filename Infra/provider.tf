terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "84382787-1367-4937-befb-9757f44087ef"

}
