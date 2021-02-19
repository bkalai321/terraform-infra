# fortios system global settings ###
resource "fortios_system_setting_global" "this" {
  hostname       = var.hostname
  admin_sport    = 443
  admin_ssh_port = 22
  admintimeout	 = 60
  timezone       = "08"
}

