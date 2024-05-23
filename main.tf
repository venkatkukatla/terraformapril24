provider "azurerm" {
  features {}

  client_id       = "2bf4a2e2-fe75-454b-98ae-77a9a95e2645"
  client_secret   = "1oh8Q~E~Beiy1rjRDPZaTH8FT~Wii8125eIYfahq"
  tenant_id       = "084bbcfb-98db-45bd-b048-4fed7182c2cd"
  subscription_id = "5ece0d01-3f1a-49e9-8c9c-2b6801722994"
}

resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.azurerm_subnet1_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes1
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.azurerm_subnet2_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes2
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet03" {
  name                 = var.azurerm_subnet3_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes3
  depends_on = [azurerm_virtual_network.vnet]
}