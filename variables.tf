variable "biglake_iceberg_tables" {
  description = <<EOT
Map of biglake_iceberg_tables, attributes below
Required:
    - catalog
    - name
    - namespace
    - schema (block):
        - fields (required, block):
            - doc (optional)
            - id (required)
            - name (required)
            - required (required)
            - type (required)
        - identifier_field_ids (optional)
        - type (optional)
Optional:
    - deletion_policy
    - location
    - project
    - properties
    - partition_spec (block):
        - fields (required, block):
            - name (required)
            - source_id (required)
            - transform (required)
    - sort_order (block):
        - fields (required, block):
            - direction (required)
            - null_order (required)
            - source_id (required)
            - transform (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    catalog         = string
    name            = string
    namespace       = string
    deletion_policy = optional(string)
    location        = optional(string)
    project         = optional(string)
    properties      = optional(map(string))
    schema = object({
      fields = list(object({
        doc      = optional(string)
        id       = number
        name     = string
        required = bool
        type     = string
      }))
      identifier_field_ids = optional(list(number))
      type                 = optional(string)
    })
    partition_spec = optional(object({
      fields = list(object({
        name      = string
        source_id = number
        transform = string
      }))
    }))
    sort_order = optional(object({
      fields = list(object({
        direction  = string
        null_order = string
        source_id  = number
        transform  = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.biglake_iceberg_tables : (
        length(v.schema.fields) >= 1
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.biglake_iceberg_tables : (
        v.partition_spec == null || (length(v.partition_spec.fields) >= 1)
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.biglake_iceberg_tables : (
        v.sort_order == null || (length(v.sort_order.fields) >= 1)
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
}

