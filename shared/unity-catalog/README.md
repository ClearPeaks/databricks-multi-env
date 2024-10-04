## Execution

```shell
terraform init
terraform plan  --var-file="../../configs/commons/unity-catalog.tfvars"
terraform apply --var-file="../../configs/commons/unity-catalog.tfvars"
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.2.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_adb_uc_metastore"></a> [adb\_uc\_metastore](#module\_adb\_uc\_metastore) | ../../module/adb-uc-metastore | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_connector_name"></a> [access\_connector\_name](#input\_access\_connector\_name) | Name of the access connector for Unity Catalog metastore | `string` | n/a | yes |
| <a name="input_databricks_account_id"></a> [databricks\_account\_id](#input\_databricks\_account\_id) | Datarbicks account ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location for the resources in this module | `string` | n/a | yes |
| <a name="input_metastore_name"></a> [metastore\_name](#input\_metastore\_name) | the name of the metastore | `string` | n/a | yes |
| <a name="input_metastore_storage_name"></a> [metastore\_storage\_name](#input\_metastore\_storage\_name) | Name of the storage account for Unity Catalog metastore | `string` | n/a | yes |
| <a name="input_shared_resource_group_name"></a> [shared\_resource\_group\_name](#input\_shared\_resource\_group\_name) | Name of the shared resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to attach to resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
