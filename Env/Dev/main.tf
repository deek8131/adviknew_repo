provider "azurerm" {
    features {}
    subscription_id = "5fbead97-423e-4814-809c-114db991d911"
}



resource "azurerm_resource_group" "example" {
    name     = "example-resources"
    location = "East US"
}

resource "azapi_resource" "arcEnabledMachine" {
  type      = "Microsoft.HybridCompute/machines@2021-05-20"
  name      = "name"
  location  = "location"
}

resource "azapi_resource" "guestConfigAssignment" {
  type      = "Microsoft.GuestConfiguration/guestConfigurationAssignments@2022-01-25"
  name      = "name"
  parent_id = azapi_resource.arcEnabledMachine.id
  location  = "location"
  body = {
    properties = {
      guestConfiguration = {
        name            = "configurationName"
        assignmentType  = "ApplyAndMonitor"
        version         = "1.*"
      }
    }
  }
}
