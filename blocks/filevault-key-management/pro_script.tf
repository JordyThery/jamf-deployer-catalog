resource "jamfplatform_pro_script" "reissuefilevaultkey_sh" {
  category_id     = var.dep_category_ids["Global"]
  name            = "${var.name_prefix}ReissueFileVaultKey.sh"
  priority        = "AFTER"
  script_contents = file("${path.module}/files/scripts/ReissueFileVaultKey.sh")
}
