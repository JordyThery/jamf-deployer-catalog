resource "jamfplatform_pro_mobile_device_configuration_profile" "lock_screen_1_1" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Lock Screen - 1:1"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Lock Screen - 1-1.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
        var.dep_device_group_jamf_pro_ids["All Unsupervised (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All 1:1 (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "lock_screen_shared" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Lock Screen - Shared"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Lock Screen - Shared.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Shared (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "passcode_1_1" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Passcode - 1:1"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Passcode - 1-1.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All 1:1 (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "restrictions_baseline" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Restrictions - Baseline"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Restrictions - Baseline.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
        var.dep_device_group_jamf_pro_ids["Restrictions - Unassigned (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "restrictions_cis_level_1_enterprise" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Restrictions - CIS Level 1 Enterprise"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Restrictions - CIS Level 1 Enterprise.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
        var.dep_device_group_jamf_pro_ids["Restrictions - Unassigned (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "restrictions_shared" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Restrictions - Shared"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Restrictions - Shared.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
        var.dep_device_group_jamf_pro_ids["Restrictions - Unassigned (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Shared (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}

resource "jamfplatform_pro_mobile_device_configuration_profile" "software_update_deferral" {
  general = {
    category_id                              = var.dep_category_ids["Global"]
    distribution_method                      = "Install Automatically"
    level                                    = "Device Level"
    name                                     = "${var.name_prefix}Software Update Deferral"
    payloads                                 = file("${path.module}/files/mobile_device_configuration_profiles/Software Update Deferral.mobileconfig")
    redeploy_days_before_certificate_expires = 0
    redeploy_on_update                       = "Newly Assigned"
    site_id                                  = "-1"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      department_ids                        = []
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["Excluded (mobile)"],
      ]
      mobile_device_ids   = []
      network_segment_ids = []
      user_group_ids      = []
      user_ids            = []
    }
    limitations = {
      directory_service_or_local_user_names = []
      directory_service_user_group_names    = []
      ibeacon_ids                           = []
      network_segment_ids                   = []
    }
    targets = {
      all_jss_users      = false
      all_mobile_devices = false
      building_ids       = []
      department_ids     = []
      mobile_device_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed (mobile)"],
      ]
      mobile_device_ids = []
      user_group_ids    = []
      user_ids          = []
    }
  }
  self_service = {
    removal_disallowed = "Never"
  }
}
