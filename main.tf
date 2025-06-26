terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}
provider "azurerm" {
  features {}

  subscription_id = "43b65481-c608-4e9f-b5e8-948c5f776940"
  client_id       = "e235a4bf-bf8a-4b2b-a296-64801c6b7f4a"
  client_secret   = "CAm8Q~Eh83up9imMMRzwZaxTDAxWuqX_yFsknavK"
  tenant_id       = "7f65aafd-9773-4578-8ca1-e0734437d3a1"
}

# 1. Resource Group
resource "azurerm_resource_group" "wpm" {
  name     = var.resource_group_name
  location = var.location
}

# 2. App Service Plan (Linux)
resource "azurerm_service_plan" "wpm" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.wpm.location
  resource_group_name = azurerm_resource_group.wpm.name
  os_type             = var.os_type
  sku_name            = var.app_service_plan_sku  # Basic tier (can be S1 or P1v2 if needed)
}

# 3. Web App for .NET 7 (Linux)
resource "azurerm_linux_web_app" "wpm" {
  name                = var.web_name  # Must be globally unique
  location            = azurerm_resource_group.wpm.location
  resource_group_name = azurerm_resource_group.wpm.name
  service_plan_id     = azurerm_service_plan.wpm.id

  site_config {
    application_stack {
      dotnet_version = "7.0"
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }
}