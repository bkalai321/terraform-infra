###################
# Fortigate Network Section
###################

# Internal Interfaces

# resource "fortios_networking_interface_port" "internal" {
#     name = "internal"
#     mode = "static"
#     role = "lan"
#     defaultgw = "enable"
#     type = "vlan"
#     ip = "172.16.230.1/255.255.255.0"
#     interface = "internal"
#     allowaccess = "ping"
# }


    role = "lan"
    mode = "static"
    defaultgw = "enable"
    distance = "33"
    type = "vlan"
    vlanid = "3"
    name = "myinterface2"
    vdom = "root"
    ip = "3.123.33.10/24"
    interface = "port2"
    allowaccess = "ping"
}

# Physical Interfaces 

resource "fortios_networking_interface_port" "dmz" {
    name = "dmz"
    ip = var.dmz_ip
    status = "up"
    device_identification = "disable"
    role = "dmz"
    allowaccess = "ping https http capwap fgfm"
    mode = "static"
    dns_server_override = "enable"
    defaultgw = "enable"
    type = "physical"
}

resource "fortios_networking_interface_port" "wan1" {
    name = "wan1"
    ip = var.wan1_ip
    status = "up"
    device_identification = "disable"
    role = "wan"
    allowaccess = "ping https ssh http capwap"
    mode = "static"
    dns_server_override = "enable"
    defaultgw = "enable"
    type = "physical"
}

resource "fortios_networking_interface_port" "wan2" {
    name = "wan2"
    ip = var.wan2_ip
    status = "up"
    device_identification = "disable"
    role = "wan"
    allowaccess = "ping https ssh http capwap"
    mode = "static"
    dns_server_override = "enable"
    defaultgw = "enable"
    type = "physical"
    distance = 5
}