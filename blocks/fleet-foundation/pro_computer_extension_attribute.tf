resource "jamfplatform_pro_computer_extension_attribute" "testing" {
  allow_multiple_values = false
  data_type             = "STRING"
  enabled               = true
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Testing"
  popup_menu_choices    = ["Assigned"]
}

resource "jamfplatform_pro_computer_extension_attribute" "restrictions" {
  allow_multiple_values = false
  data_type             = "STRING"
  enabled               = true
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Restrictions"
  popup_menu_choices    = ["Unassigned"]
}

resource "jamfplatform_pro_computer_extension_attribute" "administrator_rights" {
  allow_multiple_values = false
  data_type             = "STRING"
  enabled               = true
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Administrator Rights"
  popup_menu_choices    = ["Assigned"]
}

resource "jamfplatform_pro_computer_extension_attribute" "classification" {
  allow_multiple_values = false
  data_type             = "STRING"
  description           = "For use with User Initiated Enrollment and takeover of existing instances"
  enabled               = true
  input_type            = "POPUP"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Classification"
  popup_menu_choices    = ["1:1", "Shared"]
}

resource "jamfplatform_pro_computer_extension_attribute" "notes" {
  allow_multiple_values = false
  data_type             = "STRING"
  enabled               = true
  input_type            = "TEXT"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}Notes"
}

resource "jamfplatform_pro_computer_extension_attribute" "first_run" {
  allow_multiple_values = false
  data_type             = "STRING"
  description           = "Reports back imaging date of device."
  enabled               = true
  input_type            = "SCRIPT"
  inventory_display     = "EXTENSION_ATTRIBUTES"
  name                  = "${var.name_prefix}First Run"
  script                = file("${path.module}/files/extension_attributes/First Run.sh")
}
