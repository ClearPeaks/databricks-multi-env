
module "calling_lakehouse" {

  source = "../../module/adb-lakehouse"

  location                  = var.location
  spoke_resource_group_name = var.spoke_resource_group_name
  project_name              = var.project_name
  environment_name          = var.environment_name
  spoke_vnet_address_space  = var.spoke_vnet_address_space

  databricks_workspace_name       = var.databricks_workspace_name
  private_subnet_address_prefixes = var.private_subnet_address_prefixes
  public_subnet_address_prefixes  = var.public_subnet_address_prefixes
  tags                            = var.tags


}

# Fetch Metastore information from Databricks
data "databricks_metastore" "this" {
  region   = var.location
  provider = databricks.account
}

# Assign workspaces to metastore
resource "databricks_metastore_assignment" "default_metastore" {
  workspace_id = module.calling_lakehouse.workspace_id
  metastore_id = data.databricks_metastore.this.metastore_id
  provider     = databricks.account

}


# Assign AD Users to Databricks workspaces

locals {
  aad_groups = toset(var.aad_groups)
}

// Read group members of given groups from AzureAD every time Terraform is started
data "azuread_group" "this" {
  for_each     = local.aad_groups
  # display_name = each.value
  mail_nickname = each.value
}

// Add groups to databricks account
resource "databricks_group" "this" {
  provider     = databricks.account
  for_each     = data.azuread_group.this
  display_name = each.key
  external_id  = data.azuread_group.this[each.key].object_id
  force        = true
}

locals {
  all_members = toset(flatten([for group in values(data.azuread_group.this) : group.members]))
}

// Extract information about real users
data "azuread_users" "users" {
  ignore_missing = true
  object_ids     = local.all_members
}

locals {
  all_users = {
    for user in data.azuread_users.users.users : user.object_id => user
  }
}

// All governed by AzureAD, create or remove users to/from databricks account
resource "databricks_user" "this" {
  provider                 = databricks.account
  for_each                 = local.all_users
  user_name                = lower(local.all_users[each.key]["user_principal_name"])
  display_name             = local.all_users[each.key]["display_name"]
  active                   = local.all_users[each.key]["account_enabled"]
  external_id              = each.key
  force                    = true
  disable_as_user_deletion = true # default behavior

// Review warning before deactivating or deleting users from databricks account
// https://learn.microsoft.com/en-us/azure/databricks/administration-guide/users-groups/scim/#add-users-and-groups-to-your-azure-databricks-account-using-azure-active-directory-azure-ad
  lifecycle {
    prevent_destroy = true
  }
}

// Extract information about service prinicpals users
data "azuread_service_principals" "spns" {
  object_ids = toset(setsubtract(local.all_members, data.azuread_users.users.object_ids))
}

locals {
  all_spns = {
    for sp in data.azuread_service_principals.spns.service_principals : sp.object_id => sp
  }
}

// All governed by AzureAD, create or remove service to/from databricks account
resource "databricks_service_principal" "sp" {
  provider       = databricks.account
  for_each       = local.all_spns
  application_id = local.all_spns[each.key]["application_id"]
  display_name   = local.all_spns[each.key]["display_name"]
  active         = local.all_spns[each.key]["account_enabled"]
  external_id    = each.key
  force          = true
}

locals {
  account_admin_members = toset(flatten([for group in values(data.azuread_group.this) : [group.display_name == "account_unity_admin" ? group.members : []]]))
}

# Extract information about real account admins users
data "azuread_users" "account_admin_users" {
  ignore_missing = true
  object_ids     = local.account_admin_members
}

locals {
  all_account_admin_users = {
    for user in data.azuread_users.account_admin_users.users : user.object_id => user
  }
}

// Making all users on account_unity_admin group as databricks account admin
resource "databricks_user_role" "account_admin" {
  provider = databricks.account
  for_each = local.all_account_admin_users
  user_id  = databricks_user.this[each.key].id
  role     = "account_admin"
  depends_on = [databricks_group.this, databricks_user.this, databricks_service_principal.sp]
}
