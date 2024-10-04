output "databricks_groups" {
  value = {
    for group in databricks_group.this : group.display_name  => group.id
  }
}
output "databricks_users" {
  value = {
    for user in databricks_user.this : user.display_name  => user.id
  }
}
output "databricks_sps" {
  value = {
    for sp in databricks_service_principal.sp : sp.display_name  => sp.id
  }
}