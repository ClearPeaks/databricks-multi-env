# Required variables
location                  = "uksouth"
spoke_resource_group_name = "rg-dbs-prod-env"
project_name              = "dbs-poc"
environment_name          = "prod"
spoke_vnet_address_space  = "10.0.0.0/16"

databricks_workspace_name       = "dbw-poc-prod"
private_subnet_address_prefixes = ["10.0.1.0/24"]
public_subnet_address_prefixes  = ["10.0.2.0/24"]

databricks_account_id = "af587e06-4e3e-4d83-943d-68e7f131287d"

 # Assign AD users
 aad_groups = ["bigdata"]

# Optional variables with default values
create_resource_group       = true
managed_resource_group_name = "rg-databricks-managed-prod"
storage_account_names       = ["stadbs-poc-prod"]
# data_factory_name              = "adf-dbs-poc-prod"
# key_vault_name                 = "kv-dbs-poc-prod"

## Meta Data
tags = {
  createdByTerraform = "True"
  createdBy          = "saqib.tamli@someone.com"
  Team               = "BDC"
  Owner              = "saqib.tamli@someone.com"
  Project            = "Databricks Infra"
  Project-Type       = "POC"
  Requestor          = "saqib.tamli@someone.com"
}
