resource "jamfplatform_pro_macos_configuration_profile" "energy_saver_schedule_desktops" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Energy Saver Schedule - Desktops"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Energy Saver Schedule - Desktops.mobileconfig")
    redeploy_on_update  = "Newly Assigned"
    site_id             = "-1"
  }
  scope = {
    exclusions = {
      building_ids = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded"],
        var.dep_device_group_jamf_pro_ids["All 1:1"],
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
        var.dep_device_group_jamf_pro_ids["All Desktops"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "energy_saver_desktops" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Energy Saver - Desktops"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Energy Saver - Desktops.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["All Desktops"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "self_service_privilege_elevation" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Self Service+ - Privilege Elevation"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Self Service+ - Privilege Elevation.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["Administrator Rights - Assigned"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "finder" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Finder"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Finder.mobileconfig")
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

resource "jamfplatform_pro_macos_configuration_profile" "energy_saver_laptops" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Energy Saver - Laptops"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Energy Saver - Laptops.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["All Laptops"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "managed_login_items_allow_managed_services" {
  general = {
    category_id         = var.dep_category_ids["Managed Login Items"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Managed Login Items - Allow Managed Services"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Managed Login Items - Allow Managed Services.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["UAMDM - 13.0+"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "pppc_allow_jamf_self_service" {
  general = {
    category_id         = var.dep_category_ids["PPPC"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}PPPC - Allow Jamf Self Service+"
    payloads            = file("${path.module}/files/macos_configuration_profiles/PPPC - Allow Jamf Self Service+.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["UAMDM"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "pppc_allow_warden" {
  general = {
    category_id         = var.dep_category_ids["PPPC"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}PPPC - Allow Warden"
    payloads            = file("${path.module}/files/macos_configuration_profiles/PPPC - Allow Warden.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["UAMDM"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}
