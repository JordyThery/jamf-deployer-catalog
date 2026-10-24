resource "jamfplatform_pro_restricted_software" "microsoft_autoupdate_mau" {
  general = {
    delete_application                   = false
    kill_process                         = true
    name                                 = "${var.name_prefix}Microsoft AutoUpdate (MAU)"
    process_name                         = "Microsoft AutoUpdate"
    restrict_exact_process_name          = true
    send_email_notification_on_violation = false
    site_id                              = "-1"
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
    }
    targets = {
      all_computers = false
      building_ids  = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed"],
      ]
      computer_ids   = []
      department_ids = []
    }
  }
}

resource "jamfplatform_pro_restricted_software" "microsoft_update_assistant" {
  general = {
    delete_application                   = false
    kill_process                         = true
    name                                 = "${var.name_prefix}Microsoft Update Assistant"
    process_name                         = "Microsoft Update Assistant"
    restrict_exact_process_name          = true
    send_email_notification_on_violation = false
    site_id                              = "-1"
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
    }
    targets = {
      all_computers = false
      building_ids  = []
      computer_group_ids = [
        var.dep_device_group_jamf_pro_ids["All Managed"],
      ]
      computer_ids   = []
      department_ids = []
    }
  }
}
