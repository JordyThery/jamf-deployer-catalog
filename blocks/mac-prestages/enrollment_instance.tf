variable "ade_instance_name" {
  description = "Name of the tenant's Automated Device Enrollment instance that PreStage enrollments attach to."
  type        = string
}

data "jamfplatform_pro_automated_device_enrollment" "instance" {
  name = var.ade_instance_name
}