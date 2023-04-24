terraform {
  required_version = ">= 1.1.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.8.0 " #source : https://github.com/hashicorp/terraform-provider-azurerm/releases
    }

  }

}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}
