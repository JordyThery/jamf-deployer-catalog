resource "jamfplatform_device_group" "administrator_rights_assigned_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.administrator_rights.name
      operator = "is"
      order    = 0
      value    = "Assigned"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}Administrator Rights - Assigned"
}

resource "jamfplatform_device_group" "all_1_1_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_mobile_device_extension_attribute.classification.name
      operator = "is"
      order    = 0
      value    = "1:1"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.prestage_not_assigned_mobile.name
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
    {
      and_or   = "or"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 3
      value    = "^${local.prestage_pattern}1:1"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 4
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
    {
      and_or   = "or"
      criteria = "Enrollment Method: User-initiated - no invitation"
      operator = "is"
      order    = 5
      value    = "Yes"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 6
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All 1:1"
}

resource "jamfplatform_device_group" "all_1_1_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.classification.name
      operator = "is"
      order    = 0
      value    = "1:1"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.prestage_not_assigned_computer.name
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_computer.name
    },
    {
      and_or   = "or"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 3
      value    = "^${local.prestage_pattern}1:1"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 4
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All 1:1"
}

resource "jamfplatform_device_group" "all_1_1_email_address_is_present_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 0
      value    = jamfplatform_device_group.all_1_1_mobile.name
    },
    {
      and_or   = "and"
      criteria = "Email Address"
      operator = "like"
      order    = 1
      value    = "@"
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All 1:1 - Email Address Is Present"
}

resource "jamfplatform_device_group" "all_apple_silicon_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Architecture Type"
      operator = "is"
      order    = 0
      value    = "arm64"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Apple Silicon"
}

resource "jamfplatform_device_group" "all_desktops_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Model"
      operator = "not like"
      order    = 0
      value    = "Book"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Desktops"
}

resource "jamfplatform_device_group" "all_intel_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Architecture Type"
      operator = "is"
      order    = 0
      value    = "x86_64"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Intel"
}

resource "jamfplatform_device_group" "all_laptops_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Model"
      operator = "like"
      order    = 0
      value    = "Book"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Laptops"
}

resource "jamfplatform_device_group" "all_managed_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Device Ownership Type"
      operator = "is"
      order    = 0
      value    = "Institutional"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.prestage_is_assigned_mobile.name
    },
    {
      and_or   = "or"
      criteria = jamfplatform_pro_mobile_device_extension_attribute.classification.name
      operator = "is not"
      order    = 2
      value    = ""
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All Managed"
}

resource "jamfplatform_device_group" "all_managed_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 0
      value    = jamfplatform_device_group.first_run_complete_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Managed"
}

resource "jamfplatform_device_group" "all_migrated_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "App Identifier"
      operator = "is"
      order    = 0
      value    = "com.jamf.migrate"
    },
    {
      and_or   = "and"
      criteria = "Enrollment Method: User-initiated - no invitation"
      operator = "is"
      order    = 1
      value    = "Yes"
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All Migrated"
}

resource "jamfplatform_device_group" "all_shared_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_mobile_device_extension_attribute.classification.name
      operator = "is"
      order    = 0
      value    = "Shared"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.prestage_not_assigned_mobile.name
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
    {
      and_or   = "or"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 3
      value    = "^${local.prestage_pattern}Shared"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 4
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All Shared"
}

resource "jamfplatform_device_group" "all_shared_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.classification.name
      operator = "is"
      order    = 0
      value    = "Shared"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.prestage_not_assigned_computer.name
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_computer.name
    },
    {
      and_or   = "or"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 3
      value    = "^${local.prestage_pattern}Shared"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 4
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}All Shared"
}

resource "jamfplatform_device_group" "all_unsupervised_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Supervised"
      operator = "is"
      order    = 0
      value    = "Unsupervised"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}All Unsupervised"
}

resource "jamfplatform_device_group" "classification_is_assigned_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.classification.name
      operator = "is not"
      order    = 0
      value    = ""
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}Classification Is Assigned"
}

resource "jamfplatform_device_group" "excluded_mobile" {
  device_type = "mobile"
  group_type  = "static"
  name        = "${var.name_prefix}Excluded"
}

resource "jamfplatform_device_group" "excluded_computer" {
  device_type = "computer"
  group_type  = "static"
  name        = "${var.name_prefix}Excluded"
}

resource "jamfplatform_device_group" "filevault_key_invalid_or_unknown_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "FileVault 2 Individual Key Validation"
      operator = "is not"
      order    = 0
      value    = "Valid"
    },
    {
      and_or   = "and"
      criteria = "FileVault 2 Status"
      operator = "is"
      order    = 1
      value    = "Boot Partitions Encrypted"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}FileVault Key Invalid or Unknown"
}

resource "jamfplatform_device_group" "filevault_key_valid_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "FileVault 2 Individual Key Validation"
      operator = "is"
      order    = 0
      value    = "Valid"
    },
    {
      and_or   = "and"
      criteria = "FileVault 2 Status"
      operator = "is"
      order    = 1
      value    = "Boot Partitions Encrypted"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 2
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}FileVault Key Valid"
}

resource "jamfplatform_device_group" "first_run_complete_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.first_run.name
      operator = "is not"
      order    = 0
      value    = "Never Run"
    },
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.first_run.name
      operator = "is not"
      order    = 1
      value    = ""
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}First Run Complete"
}

resource "jamfplatform_device_group" "first_run_not_complete_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.first_run.name
      operator = "is"
      order    = 0
      value    = "Never Run"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}First Run Not Complete"
}

resource "jamfplatform_device_group" "last_enrollment_more_than_1_day_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Last Enrollment"
      operator = "more than x days ago"
      order    = 0
      value    = "1"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}Last Enrollment More Than 1 Day"
}

resource "jamfplatform_device_group" "prestage_is_assigned_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 0
      value    = "^${local.prestage_pattern}"
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Is Assigned"
}

resource "jamfplatform_device_group" "prestage_is_assigned_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 0
      value    = "^${local.prestage_pattern}"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Is Assigned"
}

resource "jamfplatform_device_group" "prestage_is_assigned_1_1_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 0
      value    = "^${local.prestage_pattern}1:1$"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Is Assigned - 1:1"
}

resource "jamfplatform_device_group" "prestage_is_assigned_shared_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Enrollment Method: PreStage enrollment"
      operator = "matches regex"
      order    = 0
      value    = "^${local.prestage_pattern}Shared$"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Is Assigned - Shared"
}

resource "jamfplatform_device_group" "prestage_not_assigned_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "not member of"
      order    = 0
      value    = jamfplatform_device_group.prestage_is_assigned_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Not Assigned"
}

resource "jamfplatform_device_group" "prestage_not_assigned_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "not member of"
      order    = 0
      value    = jamfplatform_device_group.prestage_is_assigned_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}PreStage Not Assigned"
}

resource "jamfplatform_device_group" "restrictions_unassigned_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_mobile_device_extension_attribute.restrictions.name
      operator = "is"
      order    = 0
      value    = "Unassigned"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}Restrictions - Unassigned"
}

resource "jamfplatform_device_group" "restrictions_unassigned_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.restrictions.name
      operator = "is"
      order    = 0
      value    = "Unassigned"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}Restrictions - Unassigned"
}

resource "jamfplatform_device_group" "testing_mobile" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_mobile_device_extension_attribute.testing.name
      operator = "is"
      order    = 0
      value    = "Assigned"
    },
    {
      and_or   = "and"
      criteria = "Mobile Device Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_mobile.name
    },
  ]
  device_type = "mobile"
  group_type  = "smart"
  name        = "${var.name_prefix}Testing"
}

resource "jamfplatform_device_group" "testing_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = jamfplatform_pro_computer_extension_attribute.testing.name
      operator = "is"
      order    = 0
      value    = "Assigned"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}Testing"
}

resource "jamfplatform_device_group" "uamdm_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "User Approved MDM"
      operator = "is"
      order    = 0
      value    = "Yes"
    },
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 1
      value    = jamfplatform_device_group.all_managed_computer.name
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}UAMDM"
}

resource "jamfplatform_device_group" "uamdm_13_0_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 0
      value    = jamfplatform_device_group.uamdm_computer.name
    },
    {
      and_or   = "and"
      criteria = "Operating System Version"
      operator = "greater than or equal"
      order    = 1
      value    = "13.0"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}UAMDM - 13.0+"
}

resource "jamfplatform_device_group" "uamdm_15_0_computer" {
  criteria = [
    {
      and_or   = "and"
      criteria = "Computer Group"
      operator = "member of"
      order    = 0
      value    = jamfplatform_device_group.uamdm_computer.name
    },
    {
      and_or   = "and"
      criteria = "Operating System Version"
      operator = "greater than or equal"
      order    = 1
      value    = "15.0"
    },
  ]
  device_type = "computer"
  group_type  = "smart"
  name        = "${var.name_prefix}UAMDM - 15.0+"
}
