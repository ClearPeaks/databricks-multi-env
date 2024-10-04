terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.2.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.51.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.53.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "CP-CLOUD-SUPPORT"
    storage_account_name = "cpcloudsupport2tfstates"
    container_name       = "databricks-multienv-poc"
    key                  = "terraform.tfstate"
  }
}



# Configure the Azure provider using a Service Principal
provider "azurerm" {
  features {}
}

provider "azuread" {
}

provider "databricks" {

  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.databricks_account_id
}
