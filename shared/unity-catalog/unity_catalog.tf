# Calling Unity Catalog Module
module "adb_uc_metastore" {
  source = "../../module/adb-uc-metastore"

  shared_resource_group_name = var.shared_resource_group_name
  location                   = var.location
  metastore_storage_name     = var.metastore_storage_name
  access_connector_name      = var.access_connector_name
  metastore_name             = var.metastore_name
  tags                       = var.tags

  providers = {
    azurerm    = azurerm
    databricks = databricks.account
  }

}
