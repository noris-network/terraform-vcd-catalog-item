# terraform-vcd-catalog-item

Terraform module which manages catalog_item ressources (upload .ova files) in a catalog on VMWare Cloud Director.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | >= 3.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_catalog_item.catalog_item](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/catalog_item) | resource |
| [vcd_catalog.catalog](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/catalog) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_name"></a> [catalog\_name](#input\_catalog\_name) | The name of the catalog where to upload OVA file. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Item name in the catalog. | `string` | n/a | yes |
| <a name="input_vdc_org_name"></a> [vdc\_org\_name](#input\_vdc\_org\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the item. | `string` | `null` | no |
| <a name="input_metadata_entry"></a> [metadata\_entry](#input\_metadata\_entry) | A set of metadata entries to assign. | `list(map(string))` | `[]` | no |
| <a name="input_ova_path"></a> [ova\_path](#input\_ova\_path) | Absolute or relative path to file to upload. | `string` | `null` | no |
| <a name="input_ovf_url"></a> [ovf\_url](#input\_ovf\_url) | URL to OVF file. Only OVF (not OVA) files are supported by VCD uploading by URL. | `string` | `null` | no |
| <a name="input_upload_piece_size"></a> [upload\_piece\_size](#input\_upload\_piece\_size) | Size in MB for splitting upload size. | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the uploaded .ova file. |
<!-- END_TF_DOCS -->

## Examples

```
module "ova_file" {
  source               = "git::https://github.com/noris-network/terraform-vcd-catalog-item?ref=1.0.0"
  vdc_org_name         = "myORG"
  name                 = "debian12.ova"
  description          = "My debian12.ova file"
  catalog_name         = "myCatalog"
  ova_path             = "./catalog/debian12.ova"
  upload_piece_size    = 100
}
```
