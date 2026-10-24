variable "name_prefix" {
  description = "Prefix applied to every object name."
  type        = string
}

variable "managed_by_tag" {
  description = "Provenance tag written into descriptions and notes."
  type        = string
}
variable "dep_device_group_names" {
  description = "Deployed names of device groups this block references, keyed by original object name."
  type        = map(string)
  default     = {}
}

variable "dep_extension_attribute_names" {
  description = "Deployed names of extension attributes this block references, keyed by original object name."
  type        = map(string)
  default     = {}
}

variable "dep_device_group_ids" {
  description = "IDs of device groups this block references, keyed by original object name."
  type        = map(string)
  default     = {}
}

variable "dep_device_group_jamf_pro_ids" {
  description = "Numeric Jamf Pro IDs of referenced device groups, keyed by original object name."
  type        = map(string)
  default     = {}
}

variable "dep_extension_attribute_ids" {
  description = "IDs of extension attributes this block references, keyed by original object name."
  type        = map(string)
  default     = {}
}
