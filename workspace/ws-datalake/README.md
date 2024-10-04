## Execution

```shell
terraform init
terraform plan  --var-file="../../configs/environments/${env}.tfvars"
terraform apply --var-file="../../configs/environments/${env}.tfvars"
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.2.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks.account"></a> [databricks.account](#provider\_databricks.account) | 1.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_calling_lakehouse"></a> [calling\_lakehouse](#module\_calling\_lakehouse) | ../../module/adb-lakehouse | n/a |

## Resources

| Name | Type |
|------|------|
| [databricks_metastore_assignment.default_metastore](https://registry.terraform.io/providers/databricks/databricks/1.51.0/docs/resources/metastore_assignment) | resource |
| [databricks_metastore.this](https://registry.terraform.io/providers/databricks/databricks/1.51.0/docs/data-sources/metastore) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | (Optional) Creates resource group if set to true (default) | `bool` | `true` | no |
| <a name="input_data_factory_name"></a> [data\_factory\_name](#input\_data\_factory\_name) | The name of the Azure Data Factory to deploy. Won't be created if not specified | `string` | `""` | no |
| <a name="input_databricks_account_id"></a> [databricks\_account\_id](#input\_databricks\_account\_id) | Datarbicks account ID | `string` | n/a | yes |
| <a name="input_databricks_workspace_name"></a> [databricks\_workspace\_name](#input\_databricks\_workspace\_name) | Name of Databricks workspace | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | (Required) The name of the project environment associated with the infrastructure to be managed by Terraform | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | The name of the Azure Key Vault to deploy. Won't be created if not specified | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location for the resources in this module | `string` | n/a | yes |
| <a name="input_managed_resource_group_name"></a> [managed\_resource\_group\_name](#input\_managed\_resource\_group\_name) | (Optional) The name of the resource group where Azure should place the managed Databricks resources | `string` | `""` | no |
| <a name="input_private_subnet_address_prefixes"></a> [private\_subnet\_address\_prefixes](#input\_private\_subnet\_address\_prefixes) | Address space for private Databricks subnet | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) The name of the project associated with the infrastructure to be managed by Terraform | `string` | n/a | yes |
| <a name="input_public_subnet_address_prefixes"></a> [public\_subnet\_address\_prefixes](#input\_public\_subnet\_address\_prefixes) | Address space for public Databricks subnet | `list(string)` | n/a | yes |
| <a name="input_spoke_resource_group_name"></a> [spoke\_resource\_group\_name](#input\_spoke\_resource\_group\_name) | (Required) The name of the Resource Group to create | `string` | n/a | yes |
| <a name="input_spoke_vnet_address_space"></a> [spoke\_vnet\_address\_space](#input\_spoke\_vnet\_address\_space) | (Required) The address space for the spoke Virtual Network | `string` | n/a | yes |
| <a name="input_storage_account_names"></a> [storage\_account\_names](#input\_storage\_account\_names) | Names of additional storage accounts to create | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to attach to resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
