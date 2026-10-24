output "script_ids" {
  value = {
    "DeleteAppleApps.sh"         = jamfplatform_pro_script.deleteappleapps_sh.id
    "FirstRunComplete.sh"        = jamfplatform_pro_script.firstruncomplete_sh.id
    "InstallRosetta.sh"          = jamfplatform_pro_script.installrosetta_sh.id
    "PromptForClassification.sh" = jamfplatform_pro_script.promptforclassification_sh.id
    "WaitForProfiles.sh"         = jamfplatform_pro_script.waitforprofiles_sh.id
  }
}


output "script_names" {
  value = {
    "DeleteAppleApps.sh"         = jamfplatform_pro_script.deleteappleapps_sh.name
    "FirstRunComplete.sh"        = jamfplatform_pro_script.firstruncomplete_sh.name
    "InstallRosetta.sh"          = jamfplatform_pro_script.installrosetta_sh.name
    "PromptForClassification.sh" = jamfplatform_pro_script.promptforclassification_sh.name
    "WaitForProfiles.sh"         = jamfplatform_pro_script.waitforprofiles_sh.name
  }
}

