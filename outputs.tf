output "biglake_iceberg_tables_id" {
  description = "Map of id values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no id are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "biglake_iceberg_tables_catalog" {
  description = "Map of catalog values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no catalog are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.catalog if v.catalog != null && length(v.catalog) > 0 }
}
output "biglake_iceberg_tables_deletion_policy" {
  description = "Map of deletion_policy values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no deletion_policy are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "biglake_iceberg_tables_location" {
  description = "Map of location values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no location are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.location if v.location != null && length(v.location) > 0 }
}
output "biglake_iceberg_tables_name" {
  description = "Map of name values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no name are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "biglake_iceberg_tables_namespace" {
  description = "Map of namespace values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no namespace are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "biglake_iceberg_tables_partition_spec" {
  description = "Map of partition_spec values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no partition_spec are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => one(v.partition_spec) if v.partition_spec != null && length(v.partition_spec) > 0 }
}
output "biglake_iceberg_tables_project" {
  description = "Map of project values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no project are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.project if v.project != null && length(v.project) > 0 }
}
output "biglake_iceberg_tables_properties" {
  description = "Map of properties values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no properties are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => v.properties if v.properties != null && length(v.properties) > 0 }
}
output "biglake_iceberg_tables_schema" {
  description = "Map of schema values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no schema are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => one(v.schema) if v.schema != null && length(v.schema) > 0 }
}
output "biglake_iceberg_tables_sort_order" {
  description = "Map of sort_order values across all biglake_iceberg_tables, keyed the same as var.biglake_iceberg_tables except keys with no sort_order are omitted"
  value       = { for k, v in google_biglake_iceberg_table.biglake_iceberg_tables : k => one(v.sort_order) if v.sort_order != null && length(v.sort_order) > 0 }
}

