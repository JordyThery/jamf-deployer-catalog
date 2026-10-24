resource "jamfplatform_pro_advanced_mobile_device_search" "public_all_1_1" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Mobile Device Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All 1:1 (mobile)"]
    },
  ]
  display_fields = ["Display Name", "Model", "Serial Number"]
  name           = "${var.name_prefix}Search - All 1:1"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_mobile_device_search" "public_all_managed" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Mobile Device Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All Managed (mobile)"]
    },
  ]
  display_fields = ["Display Name", "Model", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All Managed"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_mobile_device_search" "public_all_mobile_devices" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Display Name"
      priority                = 0
      search_type             = "like"
      value                   = "%"
    },
  ]
  display_fields = ["Asset Tag", "Display Name", "Email Address", "Full Name", "Last Enrollment", "Model", "OS Version", var.dep_extension_attribute_names["Notes"], "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All Mobile Devices"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_mobile_device_search" "public_all_shared" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Mobile Device Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All Shared (mobile)"]
    },
  ]
  display_fields = ["Display Name", "Model", "OS Version", "Serial Number"]
  name           = "${var.name_prefix}Search - All Shared"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_mobile_device_search" "public_restrictions_unassigned" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Mobile Device Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["Restrictions - Unassigned (mobile)"]
    },
  ]
  display_fields = ["Display Name", "Model", "Serial Number"]
  name           = "${var.name_prefix}Search - Restrictions - Unassigned"
  site_id        = "-1"
}
