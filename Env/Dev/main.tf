provider "azurerm" {
    features {}
    subscription_id = "5fbead97-423e-4814-809c-114db991d911"
}



resource "azurerm_resource_group" "example" {
    name     = "example-resources"
    location = "East US"
}