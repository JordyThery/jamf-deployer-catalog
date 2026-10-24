resource "jamfplatform_pro_script" "deleteappleapps_sh" {
  category_id     = var.dep_category_ids["Provisioning"]
  name            = "${var.name_prefix}DeleteAppleApps.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/DeleteAppleApps.sh")
}

resource "jamfplatform_pro_script" "firstruncomplete_sh" {
  category_id     = var.dep_category_ids["Provisioning"]
  name            = "${var.name_prefix}FirstRunComplete.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/FirstRunComplete.sh")
}

resource "jamfplatform_pro_script" "installrosetta_sh" {
  category_id     = var.dep_category_ids["Global"]
  name            = "${var.name_prefix}InstallRosetta.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/InstallRosetta.sh")
}

resource "jamfplatform_pro_script" "promptforclassification_sh" {
  category_id     = var.dep_category_ids["Provisioning"]
  name            = "${var.name_prefix}PromptForClassification.sh"
  parameter_4     = "Client ID for Jamf Pro API"
  parameter_5     = "Client Secret for Jamf Pro API"
  parameter_6     = "Extension Attribute Name"
  parameter_7     = "Enrollment Policy Trigger"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/PromptForClassification.sh")
}

resource "jamfplatform_pro_script" "waitforprofiles_sh" {
  category_id     = var.dep_category_ids["Provisioning"]
  name            = "${var.name_prefix}WaitForProfiles.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/WaitForProfiles.sh")
}
