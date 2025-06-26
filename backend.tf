terraform {
  backend "azurerm" {
    resource_group_name   = "WisdomPetMedicine-RG"
    storage_account_name  = "storageaccount30808"
    container_name        = "netcoreapp"
    key                   = "dev.tfstate"
  }
}
