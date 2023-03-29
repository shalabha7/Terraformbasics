# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Now create a resource but before that create resource groups.

# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "shalabh-rg"
  location = "West Europe"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
  name                = "shalabh-vnet"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = ["10.0.0.0/16"]
}

#Create a subnet within the vnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "shalabh-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}