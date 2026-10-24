resource "jamfplatform_pro_macos_configuration_profile" "software_update_deferral" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Software Update Deferral"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Software Update Deferral.mobileconfig")
    redeploy_on_update  = "Newly Assigned"
    site_id             = "-1"
  }
  scope = {
    exclusions = {
      building_ids = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded"],
      ]
      computer_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
      user_group_ids                        = []
      user_ids                              = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_computers = false
      all_jss_users = false
      building_ids  = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "software_update" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Software Update"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Software Update.mobileconfig")
    redeploy_on_update  = "Newly Assigned"
    site_id             = "-1"
  }
  scope = {
    exclusions = {
      building_ids = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded"],
      ]
      computer_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
      user_group_ids                        = []
      user_ids                              = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_computers = false
      all_jss_users = false
      building_ids  = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}
