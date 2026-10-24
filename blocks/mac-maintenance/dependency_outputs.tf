output "script_ids" {
  value = {
    "CollectLogs.sh" = jamfplatform_pro_script.collectlogs_sh.id
  }
}


output "script_names" {
  value = {
    "CollectLogs.sh" = jamfplatform_pro_script.collectlogs_sh.name
  }
}

