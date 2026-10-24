resource "jamfplatform_pro_app_installer" "microsoft_outlook_365_automatic" {
  app_title_name                     = "Microsoft Outlook 365"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Outlook 365 - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_onedrive_automatic" {
  app_title_name                     = "Microsoft OneDrive"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft OneDrive - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_edge_automatic" {
  app_title_name                     = "Microsoft Edge"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Edge - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_word_365_automatic" {
  app_title_name                     = "Microsoft Word 365"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Word 365 - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_onenote_365_automatic" {
  app_title_name                     = "Microsoft OneNote 365"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft OneNote 365 - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_powerpoint_365_automatic" {
  app_title_name                     = "Microsoft PowerPoint 365"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft PowerPoint 365 - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_windows_app_automatic" {
  app_title_name                     = "Microsoft Windows App"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Windows App - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_teams_automatic" {
  app_title_name                     = "Microsoft Teams"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Teams - Automatic"
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

resource "jamfplatform_pro_app_installer" "microsoft_excel_365_automatic" {
  app_title_name                     = "Microsoft Excel 365"
  category_id                        = var.dep_category_ids["Applications"]
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  enabled                            = true
  install_predefined_config_profiles = true
  name                               = "${var.name_prefix}Microsoft Excel 365 - Automatic"
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
