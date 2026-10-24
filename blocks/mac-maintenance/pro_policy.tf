resource "jamfplatform_pro_policy" "collect_logs" {
  disk_encryption = {
    action = "none"
  }
  dock_items = {}
  efi_password = {
    of_mode = "none"
  }
  files_and_processes = {
    delete_file_if_found   = false
    kill_process_if_found  = false
    update_locate_database = false
  }
  general = {
    category_id = var.dep_category_ids["Global"]
    date_time_limitations = {
    }
    enabled                         = true
    frequency                       = "Ongoing"
    limit_to_jamf_pro_assigned_user = false
    name                            = "${var.name_prefix}Collect Logs"
    network_limitations = {
    }
    network_requirements        = "Any"
    notify_on_each_failed_retry = false
    offline                     = false
    override_default_settings = {
    }
    retry_attempts                = -1
    retry_event                   = "none"
    site_id                       = "-1"
    target_drive                  = "/"
    trigger_checkin               = false
    trigger_enrollment_complete   = false
    trigger_login                 = false
    trigger_network_state_changed = false
    trigger_startup               = false
  }
  maintenance = {
    fix_byhost_files        = false
    fix_disk_permissions    = false
    flush_system_caches     = false
    flush_user_caches       = false
    install_cached_packages = false
    reset_computer_names    = false
    update_inventory        = false
    verify_startup_disk     = false
  }
  management_account = {
    action = "doNotChange"
  }
  packages = {
    distribution_point = "default"
  }
  printers = {}
  restart_options = {
    delay_minutes                  = 0
    file_vault_2_reboot            = false
    no_user_logged_in              = "Do not restart"
    start_reboot_timer_immediately = false
    startup_disk                   = "Current Startup Disk"
    user_logged_in                 = "Do not restart"
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
  scripts = {
    scripts = [
      {
        id       = jamfplatform_pro_script.collectlogs_sh.id
        priority = "After"
      },
    ]
  }
  self_service = {
    categories = [
    ]
    display_notifications         = false
    ensure_users_view_description = false
    include_in_featured_category  = true
    install_button_text           = "Collect"
    notification_location         = "Self Service"
    reinstall_button_text         = "Collect"
    self_service_description      = "This will create a zip file on your Desktop that will help troubleshoot issues you may be having with your Mac. Please send this file to your support engineer if they request it."
    self_service_display_name     = "Collect Logs"
    use_for_self_service          = true
  }
  user_interaction = {
    deferral_type = "none"
  }
}

resource "jamfplatform_pro_policy" "submit_inventory_on_start_up" {
  disk_encryption = {
    action = "none"
  }
  dock_items = {}
  efi_password = {
    of_mode = "none"
  }
  files_and_processes = {
    delete_file_if_found   = false
    kill_process_if_found  = false
    update_locate_database = false
  }
  general = {
    category_id = var.dep_category_ids["Global"]
    date_time_limitations = {
    }
    enabled                         = true
    frequency                       = "Ongoing"
    limit_to_jamf_pro_assigned_user = false
    name                            = "${var.name_prefix}Submit Inventory - On Start-Up"
    network_limitations = {
    }
    network_requirements        = "Any"
    notify_on_each_failed_retry = false
    offline                     = true
    override_default_settings = {
    }
    retry_attempts                = -1
    retry_event                   = "none"
    site_id                       = "-1"
    target_drive                  = "/"
    trigger_checkin               = false
    trigger_enrollment_complete   = false
    trigger_login                 = false
    trigger_network_state_changed = false
    trigger_startup               = true
  }
  maintenance = {
    fix_byhost_files        = false
    fix_disk_permissions    = false
    flush_system_caches     = false
    flush_user_caches       = false
    install_cached_packages = false
    reset_computer_names    = false
    update_inventory        = true
    verify_startup_disk     = false
  }
  management_account = {
    action = "doNotChange"
  }
  packages = {
    distribution_point = "default"
  }
  printers = {}
  restart_options = {
    delay_minutes                  = 0
    file_vault_2_reboot            = false
    no_user_logged_in              = "Do not restart"
    start_reboot_timer_immediately = false
    startup_disk                   = "Current Startup Disk"
    user_logged_in                 = "Do not restart"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      computer_group_ids                    = []
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
  scripts = {}
  self_service = {
    categories = [
    ]
    display_notifications         = false
    ensure_users_view_description = false
    include_in_featured_category  = false
    notification_location         = "Self Service"
    reinstall_button_text         = "Reinstall"
    use_for_self_service          = false
  }
  user_interaction = {
    deferral_type = "none"
  }
}

resource "jamfplatform_pro_policy" "submit_inventory_once_per_week" {
  disk_encryption = {
    action = "none"
  }
  dock_items = {}
  efi_password = {
    of_mode = "none"
  }
  files_and_processes = {
    delete_file_if_found   = false
    kill_process_if_found  = false
    update_locate_database = false
  }
  general = {
    category_id = var.dep_category_ids["Global"]
    date_time_limitations = {
    }
    enabled                         = true
    frequency                       = "Once every week"
    limit_to_jamf_pro_assigned_user = false
    name                            = "${var.name_prefix}Submit Inventory - Once Per Week"
    network_limitations = {
    }
    network_requirements        = "Any"
    notify_on_each_failed_retry = false
    offline                     = false
    override_default_settings = {
    }
    retry_attempts                = -1
    retry_event                   = "none"
    site_id                       = "-1"
    target_drive                  = "/"
    trigger_checkin               = true
    trigger_enrollment_complete   = false
    trigger_login                 = false
    trigger_network_state_changed = false
    trigger_startup               = false
  }
  maintenance = {
    fix_byhost_files        = false
    fix_disk_permissions    = false
    flush_system_caches     = false
    flush_user_caches       = false
    install_cached_packages = false
    reset_computer_names    = false
    update_inventory        = true
    verify_startup_disk     = false
  }
  management_account = {
    action = "doNotChange"
  }
  packages = {
    distribution_point = "default"
  }
  printers = {}
  restart_options = {
    delay_minutes                  = 0
    file_vault_2_reboot            = false
    no_user_logged_in              = "Do not restart"
    start_reboot_timer_immediately = false
    startup_disk                   = "Current Startup Disk"
    user_logged_in                 = "Do not restart"
  }
  scope = {
    exclusions = {
      building_ids                          = []
      computer_group_ids                    = []
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
  scripts = {}
  self_service = {
    categories = [
    ]
    display_notifications         = false
    ensure_users_view_description = false
    include_in_featured_category  = false
    notification_location         = "Self Service"
    reinstall_button_text         = "Reinstall"
    use_for_self_service          = false
  }
  user_interaction = {
    deferral_type = "none"
  }
}

resource "jamfplatform_pro_policy" "submit_inventory_self_service" {
  disk_encryption = {
    action = "none"
  }
  dock_items = {}
  efi_password = {
    of_mode = "none"
  }
  files_and_processes = {
    delete_file_if_found   = false
    kill_process_if_found  = false
    update_locate_database = false
  }
  general = {
    category_id = var.dep_category_ids["Global"]
    date_time_limitations = {
    }
    enabled                         = true
    frequency                       = "Ongoing"
    limit_to_jamf_pro_assigned_user = false
    name                            = "${var.name_prefix}Submit Inventory - Self Service"
    network_limitations = {
    }
    network_requirements        = "Any"
    notify_on_each_failed_retry = false
    offline                     = false
    override_default_settings = {
    }
    retry_attempts                = -1
    retry_event                   = "none"
    site_id                       = "-1"
    target_drive                  = "/"
    trigger_checkin               = false
    trigger_enrollment_complete   = false
    trigger_login                 = false
    trigger_network_state_changed = false
    trigger_startup               = false
  }
  maintenance = {
    fix_byhost_files        = false
    fix_disk_permissions    = false
    flush_system_caches     = false
    flush_user_caches       = false
    install_cached_packages = false
    reset_computer_names    = false
    update_inventory        = true
    verify_startup_disk     = false
  }
  management_account = {
    action = "doNotChange"
  }
  packages = {
    distribution_point = "default"
  }
  printers = {}
  restart_options = {
    delay_minutes                  = 0
    file_vault_2_reboot            = false
    no_user_logged_in              = "Do not restart"
    start_reboot_timer_immediately = false
    startup_disk                   = "Current Startup Disk"
    user_logged_in                 = "Do not restart"
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
  scripts = {}
  self_service = {
    categories = [
    ]
    display_notifications         = false
    ensure_users_view_description = false
    include_in_featured_category  = true
    install_button_text           = "Send"
    notification_location         = "Self Service"
    reinstall_button_text         = "Send"
    self_service_description      = "Submit inventory information about this device to the management system."
    self_service_display_name     = "Submit Inventory"
    use_for_self_service          = true
  }
  user_interaction = {
    deferral_type = "none"
  }
}
