variable "vdc_org_name" {
  description = "The name of the organization to use."
  type        = string
}

variable "catalog_name" {
  description = "The name of the catalog where to upload OVA file."
  type        = string
}

variable "name" {
  description = "Item name in the catalog."
  type        = string
}

variable "description" {
  description = "Description of the item."
  type        = string
  default     = null
}

variable "ova_path" {
  description = "Absolute or relative path to file to upload."
  type        = string
  default     = null
}

variable "ovf_url" {
  description = "URL to OVF file. Only OVF (not OVA) files are supported by VCD uploading by URL."
  type        = string
  default     = null
}

variable "upload_piece_size" {
  description = "Size in MB for splitting upload size."
  type        = number
  default     = 10
}

variable "metadata_entry" {
  description = "A set of metadata entries to assign."
  type        = list(map(string))
  default     = []
}
