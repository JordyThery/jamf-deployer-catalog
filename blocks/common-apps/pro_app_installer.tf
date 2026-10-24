resource "jamfplatform_pro_app_installer" "cisco_webex_automatic" {
  app_title_name                     = "Cisco Webex"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Cisco Webex - Automatic"
  notification_settings = {
    relaunch = false
    suppress = false
  }
  self_service_settings = {
    force_view_description         = false
    include_in_compliance_category = false
    include_in_featured_category   = false
  }
  site_id                     = "-1"
  smart_group_id              = var.dep_device_group_jamf_pro_ids["All Managed"]
  trigger_admin_notifications = false
  update_behavior             = "AUTOMATIC"
}

resource "jamfplatform_pro_app_installer" "google_chrome_automatic" {
  app_title_name                     = "Google Chrome"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Google Chrome - Automatic"
  notification_settings = {
    relaunch = false
    suppress = false
  }
  self_service_settings = {
    force_view_description         = false
    include_in_compliance_category = false
    include_in_featured_category   = false
  }
  site_id                     = "-1"
  smart_group_id              = var.dep_device_group_jamf_pro_ids["All Managed"]
  trigger_admin_notifications = false
  update_behavior             = "AUTOMATIC"
}

resource "jamfplatform_pro_app_installer" "zoom_client_for_meetings_automatic" {
  app_title_name                     = "Zoom Client for Meetings"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Zoom Client for Meetings - Automatic"
  notification_settings = {
    relaunch = false
    suppress = false
  }
  self_service_settings = {
    force_view_description         = false
    include_in_compliance_category = false
    include_in_featured_category   = false
  }
  site_id                     = "-1"
  smart_group_id              = var.dep_device_group_jamf_pro_ids["All Managed"]
  trigger_admin_notifications = false
  update_behavior             = "AUTOMATIC"
}

resource "jamfplatform_pro_app_installer" "adobe_acrobat_reader_dc_continuous_automatic" {
  app_title_name                     = "Adobe Acrobat Reader DC Continuous"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Adobe Acrobat Reader DC Continuous - Automatic"
  notification_settings = {
    relaunch = false
    suppress = false
  }
  self_service_settings = {
    force_view_description         = false
    include_in_compliance_category = false
    include_in_featured_category   = false
  }
  site_id                     = "-1"
  smart_group_id              = var.dep_device_group_jamf_pro_ids["All Managed"]
  trigger_admin_notifications = false
  update_behavior             = "AUTOMATIC"
}

resource "jamfplatform_pro_app_installer" "adobe_creative_cloud_automatic" {
  app_title_name                     = "Adobe Creative Cloud"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Adobe Creative Cloud - Automatic"
  notification_settings = {
    relaunch = false
    suppress = false
  }
  self_service_settings = {
    force_view_description         = false
    include_in_compliance_category = false
    include_in_featured_category   = false
  }
  site_id                     = "-1"
  smart_group_id              = var.dep_device_group_jamf_pro_ids["All Managed"]
  trigger_admin_notifications = false
  update_behavior             = "AUTOMATIC"
}
