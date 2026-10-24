resource "jamfplatform_pro_mobile_device_extension_attribute" "testing" {
  allow_multiple_values = false
  data_type             = "STRING"
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Testing"
  popup_menu_choices    = ["Assigned"]
}

resource "jamfplatform_pro_mobile_device_extension_attribute" "jss_first_run" {
  allow_multiple_values = false
  data_type             = "STRING"
  input_type            = "TEXT"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}JSS First Run"
}

resource "jamfplatform_pro_mobile_device_extension_attribute" "restrictions" {
  allow_multiple_values = false
  data_type             = "STRING"
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Restrictions"
  popup_menu_choices    = ["Unassigned"]
}

resource "jamfplatform_pro_mobile_device_extension_attribute" "classification" {
  allow_multiple_values = false
  data_type             = "STRING"
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Classification"
  popup_menu_choices    = ["1:1", "Shared"]
}

resource "jamfplatform_pro_mobile_device_extension_attribute" "notes" {
  allow_multiple_values = false
  data_type             = "STRING"
  input_type            = "TEXT"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Notes"
}
