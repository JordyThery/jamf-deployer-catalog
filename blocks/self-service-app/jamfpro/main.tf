# The Jamf Pro API sets every Self Service option at once; those the block
# has no setting for get Jamf Pro's defaults.
resource "jamfpro_self_service_settings" "this" {
  install_automatically    = var.install_automatically
  install_location         = "/Applications"
  default_landing_page     = var.default_landing_page
  notifications_enabled    = var.notifications_enabled
  user_login_level         = "NotRequired"
  allow_remember_me        = false
  use_fido2                = false
  auth_type                = "Basic"
  alert_user_approved_mdm  = true
  default_home_category_id = -1
  bookmarks_name           = "Bookmarks"
}
