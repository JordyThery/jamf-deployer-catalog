terraform {
  required_providers {
    jamfplatform = {
      source  = "jamf/jamfplatform"
      version = "1.5.0"
    }
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.12.0"
    }
  }
}

provider "jamfplatform" {
  impact_alerts = true
}

module "device_groups" {
  source         = "../blocks/device-groups"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · device-groups@1.0.0"
}

module "categories" {
  source         = "../blocks/categories"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · categories@1.0.0"
}

module "extension_attributes" {
  source         = "../blocks/extension-attributes"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · extension-attributes@1.0.0"
}

module "enrollment" {
  source            = "../blocks/enrollment"
  name_prefix       = "JD - "
  managed_by_tag    = "Managed by Jamf Deployer · enrollment@1.0.0"
  ade_instance_name = "Apple Business Manager"
}

module "filevault" {
  source                  = "../blocks/filevault"
  name_prefix             = "JD - "
  managed_by_tag          = "Managed by Jamf Deployer · filevault@1.0.0"
  scope_jamf_pro_group_id = module.device_groups.device_group_jamf_pro_ids["Pilot"]
  category_id             = module.categories.category_ids["Security"]
}

module "software_updates" {
  source                    = "../blocks/software-updates"
  name_prefix               = "JD - "
  managed_by_tag            = "Managed by Jamf Deployer · software-updates@1.0.0"
  scope_platform_group_uuid = module.device_groups.device_group_ids["Pilot"]
}

module "compliance_cis_l1" {
  source                    = "../blocks/compliance-cis-l1"
  name_prefix               = "JD - "
  managed_by_tag            = "Managed by Jamf Deployer · compliance-cis-l1@1.0.0"
  scope_platform_group_uuid = module.device_groups.device_group_ids["Pilot"]
}

module "rosetta" {
  source                  = "../blocks/rosetta"
  name_prefix             = "JD - "
  managed_by_tag          = "Managed by Jamf Deployer · rosetta@1.0.0"
  scope_jamf_pro_group_id = module.device_groups.device_group_jamf_pro_ids["Apple Silicon Macs"]
  category_id             = module.categories.category_ids["Applications"]
}

module "checkin_inventory" {
  source         = "../blocks/checkin-inventory"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · checkin-inventory@1.0.0"
}

module "reenrollment" {
  source         = "../blocks/reenrollment"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · reenrollment@1.0.0"
}

module "local_admin_password" {
  source         = "../blocks/local-admin-password"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · local-admin-password@1.0.0"
}

module "self_service_app" {
  source         = "../blocks/self-service-app"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · self-service-app@1.0.0"
}

module "macos_version_groups" {
  source         = "../blocks/macos-version-groups"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · macos-version-groups@1.0.0"
}

module "self_service_maintenance" {
  source                  = "../blocks/self-service-maintenance"
  name_prefix             = "JD - "
  managed_by_tag          = "Managed by Jamf Deployer · self-service-maintenance@1.0.0"
  scope_jamf_pro_group_id = module.device_groups.device_group_jamf_pro_ids["All Managed Macs"]
  category_id             = module.categories.category_ids["Maintenance"]
}

module "mobile_device_groups" {
  source         = "../blocks/mobile-device-groups"
  name_prefix    = "JD - "
  managed_by_tag = "Managed by Jamf Deployer · mobile-device-groups@1.0.0"
}

module "mobile_passcode" {
  source                         = "../blocks/mobile-passcode"
  name_prefix                    = "JD - "
  managed_by_tag                 = "Managed by Jamf Deployer · mobile-passcode@1.0.0"
  scope_jamf_pro_mobile_group_id = module.mobile_device_groups.device_group_jamf_pro_ids["Supervised iPads"]
  category_id                    = module.categories.category_ids["Security"]
}

module "mobile_enrollment" {
  source            = "../blocks/mobile-enrollment"
  name_prefix       = "JD - "
  managed_by_tag    = "Managed by Jamf Deployer · mobile-enrollment@1.0.0"
  ade_instance_name = "Apple Business Manager"
}
