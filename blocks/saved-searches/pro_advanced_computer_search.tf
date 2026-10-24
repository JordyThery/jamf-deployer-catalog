resource "jamfplatform_pro_advanced_computer_search" "public_all_1_1" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Computer Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All 1:1"]
    },
  ]
  display_fields = ["Asset Tag", "Computer Name", "Email Address", "Full Name", "Last Check-in", "Last Enrollment", "MAC Address", "Model", var.dep_extension_attribute_names["Notes"], "Operating System Version", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All 1:1"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_computer_search" "public_all_administrator_rights_assigned" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Computer Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["Administrator Rights - Assigned"]
    },
  ]
  display_fields = ["Asset Tag", "Computer Name", "Email Address", "Full Name", "Last Check-in", "Last Enrollment", "MAC Address", "Model", var.dep_extension_attribute_names["Notes"], "Operating System Version", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All Administrator Rights - Assigned"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_computer_search" "public_all_computers" {
  display_fields = ["Asset Tag", "Computer Name", "Email Address", "Full Name", "Last Check-in", "Last Enrollment", "MAC Address", "Model", var.dep_extension_attribute_names["Notes"], "Operating System Version", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All Computers"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_computer_search" "public_all_managed" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Computer Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All Managed"]
    },
  ]
  display_fields = ["Asset Tag", "Computer Name", "Email Address", "Full Name", "Last Check-in", "Last Enrollment", "MAC Address", "Model", var.dep_extension_attribute_names["Notes"], "Operating System Version", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - All Managed"
  site_id        = "-1"
}

resource "jamfplatform_pro_advanced_computer_search" "public_all_shared" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Computer Group"
      priority                = 0
      search_type             = "member of"
      value                   = var.dep_device_group_names["All Shared"]
    },
  ]
  name    = "${var.name_prefix}Search - All Shared"
  site_id = "-1"
}

resource "jamfplatform_pro_advanced_computer_search" "public_recently_enrolled_less_then_1_day" {
  criteria = [
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Last Enrollment"
      priority                = 0
      search_type             = "less than x days ago"
      value                   = "1"
    },
    {
      and_or                  = "and"
      has_closing_parenthesis = false
      has_opening_parenthesis = false
      name                    = "Computer Group"
      priority                = 1
      search_type             = "member of"
      value                   = var.dep_device_group_names["All Managed"]
    },
  ]
  display_fields = ["Asset Tag", "Computer Name", "Email Address", "Full Name", "Last Check-in", "Last Enrollment", "MAC Address", "Model", var.dep_extension_attribute_names["Notes"], "Operating System Version", "Serial Number", "Username"]
  name           = "${var.name_prefix}Search - Recently Enrolled Less Than 1 Day"
  site_id        = "-1"
}
