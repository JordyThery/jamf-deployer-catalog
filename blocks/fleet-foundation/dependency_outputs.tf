output "category_ids" {
  value = {
    "Applications"        = jamfplatform_pro_category.applications.id
    "Global"              = jamfplatform_pro_category.global.id
    "Managed Login Items" = jamfplatform_pro_category.managed_login_items.id
    "PPPC"                = jamfplatform_pro_category.pppc.id
    "Provisioning"        = jamfplatform_pro_category.provisioning.id
  }
}


output "category_names" {
  value = {
    "Applications"        = jamfplatform_pro_category.applications.name
    "Global"              = jamfplatform_pro_category.global.name
    "Managed Login Items" = jamfplatform_pro_category.managed_login_items.name
    "PPPC"                = jamfplatform_pro_category.pppc.name
    "Provisioning"        = jamfplatform_pro_category.provisioning.name
  }
}

output "device_group_ids" {
  value = {
    "Administrator Rights - Assigned"             = jamfplatform_device_group.administrator_rights_assigned_computer.id
    "All 1:1 (mobile)"                            = jamfplatform_device_group.all_1_1_mobile.id
    "All 1:1"                                     = jamfplatform_device_group.all_1_1_computer.id
    "All 1:1 - Email Address Is Present (mobile)" = jamfplatform_device_group.all_1_1_email_address_is_present_mobile.id
    "All Apple Silicon"                           = jamfplatform_device_group.all_apple_silicon_computer.id
    "All Desktops"                                = jamfplatform_device_group.all_desktops_computer.id
    "All Intel"                                   = jamfplatform_device_group.all_intel_computer.id
    "All Laptops"                                 = jamfplatform_device_group.all_laptops_computer.id
    "All Managed (mobile)"                        = jamfplatform_device_group.all_managed_mobile.id
    "All Managed"                                 = jamfplatform_device_group.all_managed_computer.id
    "All Migrated (mobile)"                       = jamfplatform_device_group.all_migrated_mobile.id
    "All Shared (mobile)"                         = jamfplatform_device_group.all_shared_mobile.id
    "All Shared"                                  = jamfplatform_device_group.all_shared_computer.id
    "All Unsupervised (mobile)"                   = jamfplatform_device_group.all_unsupervised_mobile.id
    "Classification Is Assigned"                  = jamfplatform_device_group.classification_is_assigned_computer.id
    "Excluded (mobile)"                           = jamfplatform_device_group.excluded_mobile.id
    "Excluded"                                    = jamfplatform_device_group.excluded_computer.id
    "FileVault Key Invalid or Unknown"            = jamfplatform_device_group.filevault_key_invalid_or_unknown_computer.id
    "FileVault Key Valid"                         = jamfplatform_device_group.filevault_key_valid_computer.id
    "First Run Complete"                          = jamfplatform_device_group.first_run_complete_computer.id
    "First Run Not Complete"                      = jamfplatform_device_group.first_run_not_complete_computer.id
    "Last Enrollment More Than 1 Day (mobile)"    = jamfplatform_device_group.last_enrollment_more_than_1_day_mobile.id
    "PreStage Is Assigned (mobile)"               = jamfplatform_device_group.prestage_is_assigned_mobile.id
    "PreStage Is Assigned"                        = jamfplatform_device_group.prestage_is_assigned_computer.id
    "PreStage Is Assigned - 1:1"                  = jamfplatform_device_group.prestage_is_assigned_1_1_computer.id
    "PreStage Is Assigned - Shared"               = jamfplatform_device_group.prestage_is_assigned_shared_computer.id
    "PreStage Not Assigned (mobile)"              = jamfplatform_device_group.prestage_not_assigned_mobile.id
    "PreStage Not Assigned"                       = jamfplatform_device_group.prestage_not_assigned_computer.id
    "Restrictions - Unassigned (mobile)"          = jamfplatform_device_group.restrictions_unassigned_mobile.id
    "Restrictions - Unassigned"                   = jamfplatform_device_group.restrictions_unassigned_computer.id
    "Testing (mobile)"                            = jamfplatform_device_group.testing_mobile.id
    "Testing"                                     = jamfplatform_device_group.testing_computer.id
    "UAMDM"                                       = jamfplatform_device_group.uamdm_computer.id
    "UAMDM - 13.0+"                               = jamfplatform_device_group.uamdm_13_0_computer.id
    "UAMDM - 15.0+"                               = jamfplatform_device_group.uamdm_15_0_computer.id
  }
}


output "device_group_names" {
  value = {
    "Administrator Rights - Assigned"             = jamfplatform_device_group.administrator_rights_assigned_computer.name
    "All 1:1 (mobile)"                            = jamfplatform_device_group.all_1_1_mobile.name
    "All 1:1"                                     = jamfplatform_device_group.all_1_1_computer.name
    "All 1:1 - Email Address Is Present (mobile)" = jamfplatform_device_group.all_1_1_email_address_is_present_mobile.name
    "All Apple Silicon"                           = jamfplatform_device_group.all_apple_silicon_computer.name
    "All Desktops"                                = jamfplatform_device_group.all_desktops_computer.name
    "All Intel"                                   = jamfplatform_device_group.all_intel_computer.name
    "All Laptops"                                 = jamfplatform_device_group.all_laptops_computer.name
    "All Managed (mobile)"                        = jamfplatform_device_group.all_managed_mobile.name
    "All Managed"                                 = jamfplatform_device_group.all_managed_computer.name
    "All Migrated (mobile)"                       = jamfplatform_device_group.all_migrated_mobile.name
    "All Shared (mobile)"                         = jamfplatform_device_group.all_shared_mobile.name
    "All Shared"                                  = jamfplatform_device_group.all_shared_computer.name
    "All Unsupervised (mobile)"                   = jamfplatform_device_group.all_unsupervised_mobile.name
    "Classification Is Assigned"                  = jamfplatform_device_group.classification_is_assigned_computer.name
    "Excluded (mobile)"                           = jamfplatform_device_group.excluded_mobile.name
    "Excluded"                                    = jamfplatform_device_group.excluded_computer.name
    "FileVault Key Invalid or Unknown"            = jamfplatform_device_group.filevault_key_invalid_or_unknown_computer.name
    "FileVault Key Valid"                         = jamfplatform_device_group.filevault_key_valid_computer.name
    "First Run Complete"                          = jamfplatform_device_group.first_run_complete_computer.name
    "First Run Not Complete"                      = jamfplatform_device_group.first_run_not_complete_computer.name
    "Last Enrollment More Than 1 Day (mobile)"    = jamfplatform_device_group.last_enrollment_more_than_1_day_mobile.name
    "PreStage Is Assigned (mobile)"               = jamfplatform_device_group.prestage_is_assigned_mobile.name
    "PreStage Is Assigned"                        = jamfplatform_device_group.prestage_is_assigned_computer.name
    "PreStage Is Assigned - 1:1"                  = jamfplatform_device_group.prestage_is_assigned_1_1_computer.name
    "PreStage Is Assigned - Shared"               = jamfplatform_device_group.prestage_is_assigned_shared_computer.name
    "PreStage Not Assigned (mobile)"              = jamfplatform_device_group.prestage_not_assigned_mobile.name
    "PreStage Not Assigned"                       = jamfplatform_device_group.prestage_not_assigned_computer.name
    "Restrictions - Unassigned (mobile)"          = jamfplatform_device_group.restrictions_unassigned_mobile.name
    "Restrictions - Unassigned"                   = jamfplatform_device_group.restrictions_unassigned_computer.name
    "Testing (mobile)"                            = jamfplatform_device_group.testing_mobile.name
    "Testing"                                     = jamfplatform_device_group.testing_computer.name
    "UAMDM"                                       = jamfplatform_device_group.uamdm_computer.name
    "UAMDM - 13.0+"                               = jamfplatform_device_group.uamdm_13_0_computer.name
    "UAMDM - 15.0+"                               = jamfplatform_device_group.uamdm_15_0_computer.name
  }
}

output "device_group_jamf_pro_ids" {
  value = {
    "Administrator Rights - Assigned"             = jamfplatform_device_group.administrator_rights_assigned_computer.jamf_pro_id
    "All 1:1 (mobile)"                            = jamfplatform_device_group.all_1_1_mobile.jamf_pro_id
    "All 1:1"                                     = jamfplatform_device_group.all_1_1_computer.jamf_pro_id
    "All 1:1 - Email Address Is Present (mobile)" = jamfplatform_device_group.all_1_1_email_address_is_present_mobile.jamf_pro_id
    "All Apple Silicon"                           = jamfplatform_device_group.all_apple_silicon_computer.jamf_pro_id
    "All Desktops"                                = jamfplatform_device_group.all_desktops_computer.jamf_pro_id
    "All Intel"                                   = jamfplatform_device_group.all_intel_computer.jamf_pro_id
    "All Laptops"                                 = jamfplatform_device_group.all_laptops_computer.jamf_pro_id
    "All Managed (mobile)"                        = jamfplatform_device_group.all_managed_mobile.jamf_pro_id
    "All Managed"                                 = jamfplatform_device_group.all_managed_computer.jamf_pro_id
    "All Migrated (mobile)"                       = jamfplatform_device_group.all_migrated_mobile.jamf_pro_id
    "All Shared (mobile)"                         = jamfplatform_device_group.all_shared_mobile.jamf_pro_id
    "All Shared"                                  = jamfplatform_device_group.all_shared_computer.jamf_pro_id
    "All Unsupervised (mobile)"                   = jamfplatform_device_group.all_unsupervised_mobile.jamf_pro_id
    "Classification Is Assigned"                  = jamfplatform_device_group.classification_is_assigned_computer.jamf_pro_id
    "Excluded (mobile)"                           = jamfplatform_device_group.excluded_mobile.jamf_pro_id
    "Excluded"                                    = jamfplatform_device_group.excluded_computer.jamf_pro_id
    "FileVault Key Invalid or Unknown"            = jamfplatform_device_group.filevault_key_invalid_or_unknown_computer.jamf_pro_id
    "FileVault Key Valid"                         = jamfplatform_device_group.filevault_key_valid_computer.jamf_pro_id
    "First Run Complete"                          = jamfplatform_device_group.first_run_complete_computer.jamf_pro_id
    "First Run Not Complete"                      = jamfplatform_device_group.first_run_not_complete_computer.jamf_pro_id
    "Last Enrollment More Than 1 Day (mobile)"    = jamfplatform_device_group.last_enrollment_more_than_1_day_mobile.jamf_pro_id
    "PreStage Is Assigned (mobile)"               = jamfplatform_device_group.prestage_is_assigned_mobile.jamf_pro_id
    "PreStage Is Assigned"                        = jamfplatform_device_group.prestage_is_assigned_computer.jamf_pro_id
    "PreStage Is Assigned - 1:1"                  = jamfplatform_device_group.prestage_is_assigned_1_1_computer.jamf_pro_id
    "PreStage Is Assigned - Shared"               = jamfplatform_device_group.prestage_is_assigned_shared_computer.jamf_pro_id
    "PreStage Not Assigned (mobile)"              = jamfplatform_device_group.prestage_not_assigned_mobile.jamf_pro_id
    "PreStage Not Assigned"                       = jamfplatform_device_group.prestage_not_assigned_computer.jamf_pro_id
    "Restrictions - Unassigned (mobile)"          = jamfplatform_device_group.restrictions_unassigned_mobile.jamf_pro_id
    "Restrictions - Unassigned"                   = jamfplatform_device_group.restrictions_unassigned_computer.jamf_pro_id
    "Testing (mobile)"                            = jamfplatform_device_group.testing_mobile.jamf_pro_id
    "Testing"                                     = jamfplatform_device_group.testing_computer.jamf_pro_id
    "UAMDM"                                       = jamfplatform_device_group.uamdm_computer.jamf_pro_id
    "UAMDM - 13.0+"                               = jamfplatform_device_group.uamdm_13_0_computer.jamf_pro_id
    "UAMDM - 15.0+"                               = jamfplatform_device_group.uamdm_15_0_computer.jamf_pro_id
  }
}

output "extension_attribute_ids" {
  value = {
    "Administrator Rights" = jamfplatform_pro_computer_extension_attribute.administrator_rights.id
    "Classification"       = jamfplatform_pro_computer_extension_attribute.classification.id
    "First Run"            = jamfplatform_pro_computer_extension_attribute.first_run.id
    "Notes"                = jamfplatform_pro_computer_extension_attribute.notes.id
    "Restrictions"         = jamfplatform_pro_computer_extension_attribute.restrictions.id
    "Testing"              = jamfplatform_pro_computer_extension_attribute.testing.id
  }
}


output "extension_attribute_names" {
  value = {
    "Administrator Rights" = jamfplatform_pro_computer_extension_attribute.administrator_rights.name
    "Classification"       = jamfplatform_pro_computer_extension_attribute.classification.name
    "First Run"            = jamfplatform_pro_computer_extension_attribute.first_run.name
    "Notes"                = jamfplatform_pro_computer_extension_attribute.notes.name
    "Restrictions"         = jamfplatform_pro_computer_extension_attribute.restrictions.name
    "Testing"              = jamfplatform_pro_computer_extension_attribute.testing.name
  }
}

