resource "jamfplatform_pro_computer_prestage_enrollment" "one_to_one" {
  anchor_certificates                   = []
  auto_advance_setup                    = false
  custom_package_distribution_point_id  = "-1"
  custom_package_ids                    = []
  default_prestage                      = false
  device_enrollment_program_instance_id = data.jamfplatform_pro_automated_device_enrollment.instance.id
  display_name                          = "${var.name_prefix}PreStage - 1:1"
  enable_device_based_activation_lock   = false
  enable_recovery_lock                  = false
  enrollment_customization_id           = "0"
  enrollment_site_id                    = "-1"
  install_profiles_during_setup         = true
  keep_existing_location_information    = false
  keep_existing_site_membership         = false
  mandatory                             = true
  mdm_removable                         = false
  prestage_installed_profile_ids = [
  ]
  prestage_minimum_os_target_version_type = "MINIMUM_OS_LATEST_MINOR_VERSION"
  prevent_activation_lock                 = true
  psso_config_profile_id                  = "-1"
  psso_enabled                            = false
  recovery_lock_password_type             = "MANUAL"
  require_authentication                  = false
  rotate_recovery_lock_password           = false
  scope_serial_numbers                    = []
}

resource "jamfplatform_pro_computer_prestage_enrollment" "shared" {
  anchor_certificates                   = []
  auto_advance_setup                    = false
  custom_package_distribution_point_id  = "-1"
  custom_package_ids                    = []
  default_prestage                      = false
  device_enrollment_program_instance_id = data.jamfplatform_pro_automated_device_enrollment.instance.id
  display_name                          = "${var.name_prefix}PreStage - Shared"
  enable_device_based_activation_lock   = false
  enable_recovery_lock                  = false
  enrollment_customization_id           = "0"
  enrollment_site_id                    = "-1"
  install_profiles_during_setup         = true
  keep_existing_location_information    = false
  keep_existing_site_membership         = false
  mandatory                             = true
  mdm_removable                         = false
  prestage_installed_profile_ids = [
  ]
  prestage_minimum_os_target_version_type = "MINIMUM_OS_LATEST_MINOR_VERSION"
  prevent_activation_lock                 = true
  psso_config_profile_id                  = "-1"
  psso_enabled                            = false
  recovery_lock_password_type             = "MANUAL"
  require_authentication                  = false
  rotate_recovery_lock_password           = false
  scope_serial_numbers                    = []
}
