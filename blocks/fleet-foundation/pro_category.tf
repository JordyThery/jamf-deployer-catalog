resource "jamfplatform_pro_category" "applications" {
  name     = "${var.name_prefix}Applications"
  priority = 9
}

resource "jamfplatform_pro_category" "global" {
  name     = "${var.name_prefix}Global"
  priority = 4
}

resource "jamfplatform_pro_category" "managed_login_items" {
  name     = "${var.name_prefix}Managed Login Items"
  priority = 9
}

resource "jamfplatform_pro_category" "pppc" {
  name     = "${var.name_prefix}PPPC"
  priority = 9
}

resource "jamfplatform_pro_category" "provisioning" {
  name     = "${var.name_prefix}Provisioning"
  priority = 1
}
