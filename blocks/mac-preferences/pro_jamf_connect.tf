resource "jamfplatform_pro_jamf_connect" "self_service_privilege_elevation" {
  auto_deployment_type = "NONE"
  profile_id           = tonumber(jamfplatform_pro_macos_configuration_profile.self_service_privilege_elevation.id)
}
