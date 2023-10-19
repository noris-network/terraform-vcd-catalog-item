data "vcd_catalog" "catalog" {
  name = var.catalog_name
}

resource "vcd_catalog_item" "catalog_item" {
  org               = var.vdc_org_name
  name              = var.name
  description       = var.description
  catalog           = data.vcd_catalog.catalog.name
  ova_path          = var.ova_path
  ovf_url           = var.ovf_url
  upload_piece_size = var.upload_piece_size

  dynamic "metadata_entry" {
    for_each = length(var.metadata_entry) > 0 ? var.metadata_entry : []
    content {
      key         = metadata_entry.value.key
      value       = metadata_entry.value.value
      type        = metadata_entry.value.type
      user_access = metadata_entry.value.user_access
      is_system   = metadata_entry.value.is_system
    }
  }
}
