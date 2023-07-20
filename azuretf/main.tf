# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  # if you need save your tf state security
  #   backend "azurerm" {
  #     resource_group_name = "value"
  #     storage_account_name = "value"
  #     container_name = "value"
  #     key = "value"
  #   }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rsg" {
  name     = "rsg${local.suffix_concat}"
  location = var.region
  tags     = local.tags

}

# Create a storage account gen2 in resource group
resource "azurerm_storage_account" "sta" {
  name                      = "sta${local.suffix_concat}"
  resource_group_name       = azurerm_resource_group.rsg.name
  location                  = var.region
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  account_kind              = "StorageV2"
  access_tier               = "Hot"
  is_hns_enabled            = true
  shared_access_key_enabled = true
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
}


# resource "azurerm_service_plan" "spl" {
#   name                = "spl${local.suffix_concat}"
#   resource_group_name = azurerm_resource_group.rsg.name
#   location            = var.region
#   os_type             = "Linux"
#   sku_name            = "F1"
# }

# resource "azurerm_linux_function_app" "fnc" {
#   name                = "fnc${local.suffix_concat}"
#   resource_group_name = azurerm_resource_group.rsg.name
#   location            = var.region

#   storage_account_name       = azurerm_storage_account.sta.name
#   storage_account_access_key = azurerm_storage_account.sta.primary_access_key
#   service_plan_id            = azurerm_service_plan.spl.id

#   site_config {

#   }
# }