resource "google_biglake_iceberg_table" "biglake_iceberg_tables" {
  for_each = var.biglake_iceberg_tables

  catalog         = each.value.catalog
  name            = each.value.name
  namespace       = each.value.namespace
  deletion_policy = each.value.deletion_policy
  location        = each.value.location
  project         = each.value.project
  properties      = each.value.properties

  schema {
    dynamic "fields" {
      for_each = each.value.schema.fields
      content {
        doc      = fields.value.doc
        id       = fields.value.id
        name     = fields.value.name
        required = fields.value.required
        type     = fields.value.type
      }
    }
    identifier_field_ids = each.value.schema.identifier_field_ids
    type                 = each.value.schema.type
  }

  dynamic "partition_spec" {
    for_each = each.value.partition_spec != null ? [each.value.partition_spec] : []
    content {
      dynamic "fields" {
        for_each = partition_spec.value.fields
        content {
          name      = fields.value.name
          source_id = fields.value.source_id
          transform = fields.value.transform
        }
      }
    }
  }

  dynamic "sort_order" {
    for_each = each.value.sort_order != null ? [each.value.sort_order] : []
    content {
      dynamic "fields" {
        for_each = sort_order.value.fields
        content {
          direction  = fields.value.direction
          null_order = fields.value.null_order
          source_id  = fields.value.source_id
          transform  = fields.value.transform
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

