resource "jamfplatform_pro_macos_configuration_profile" "restrictions_baseline" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Restrictions - Baseline"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Restrictions - Baseline.mobileconfig")
    redeploy_on_update  = "Newly Assigned"
    site_id             = "-1"
  }
  scope = {
    exclusions = {
      building_ids = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded"],
        var.dep_device_group_jamf_pro_ids["Restrictions - Unassigned"],
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

resource "jamfplatform_pro_macos_configuration_profile" "security_and_privacy_enable_firewall" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Security and Privacy - Enable Firewall"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Security and Privacy - Enable Firewall.mobileconfig")
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

resource "jamfplatform_pro_macos_configuration_profile" "security_and_privacy_filevault_escrow" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Security and Privacy - FileVault Escrow"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Security and Privacy - FileVault Escrow.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["PreStage Is Assigned"],
        var.dep_device_group_jamf_pro_ids["All Managed"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "security_and_privacy_filevault_shared" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Security and Privacy - FileVault - Shared"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Security and Privacy - FileVault - Shared.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["PreStage Is Assigned - Shared"],
        var.dep_device_group_jamf_pro_ids["All Shared"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "login_window_1_1" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Login Window - 1:1"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Login Window - 1-1.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["All 1:1"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "login_window_shared" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Login Window - Shared"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Login Window - Shared.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["All Shared"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "restrictions_shared" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Restrictions - Shared"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Restrictions - Shared.mobileconfig")
    redeploy_on_update  = "Newly Assigned"
    site_id             = "-1"
  }
  scope = {
    exclusions = {
      building_ids = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded"],
        var.dep_device_group_jamf_pro_ids["Restrictions - Unassigned"],
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
        var.dep_device_group_jamf_pro_ids["All Shared"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}

resource "jamfplatform_pro_macos_configuration_profile" "security_and_privacy_require_passcode_to_unlock_screen" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Security and Privacy - Require Passcode to Unlock Screen"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Security and Privacy - Require Passcode to Unlock Screen.mobileconfig")
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

resource "jamfplatform_pro_macos_configuration_profile" "security_and_privacy_filevault_1_1" {
  general = {
    category_id         = var.dep_category_ids["Global"]
    distribution_method = "Install Automatically"
    level               = "Computer Level"
    name                = "${var.name_prefix}Security and Privacy - FileVault - 1:1"
    payloads            = file("${path.module}/files/macos_configuration_profiles/Security and Privacy - FileVault - 1-1.mobileconfig")
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
        var.dep_device_group_jamf_pro_ids["All 1:1"],
      ]
      computer_ids   = []
      department_ids = []
      user_group_ids = []
      user_ids       = []
    }
  }
}
