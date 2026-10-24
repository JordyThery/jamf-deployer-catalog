resource "jamfplatform_pro_script" "collectlogs_sh" {
  category_id     = var.dep_category_ids["Global"]
  name            = "${var.name_prefix}CollectLogs.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/CollectLogs.sh")
}
