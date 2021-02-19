resource "fortios_firewall_security_policy" "incoming" {
    name = join("",[fortios_vpn_ipsec_phase1interface.this.id , "-incoming"]) 
    srcintf = [fortios_vpn_ipsec_phase1interface.this.id]
    dstintf = ["internal"]
    srcaddr = ["all"]
    dstaddr = ["all"]
    internet_service = "disable"
    schedule = "always"
    service = ["ALL"]
    action = "accept"
    status = "enable"
    logtraffic = "utm"
    nat = "enable"
    ssl_ssh_profile = "no-inspection"
    capture_packet = "disable"
}

resource "fortios_firewall_security_policy" "outgoing" {
    name = join("",[fortios_vpn_ipsec_phase1interface.this.id , "-outgoing"]) 
    srcintf = ["internal"]
    dstintf =  [fortios_vpn_ipsec_phase1interface.this.id]
    srcaddr = ["all"]
    dstaddr = ["all"]
    internet_service = "disable"
    schedule = "always"
    service = ["ALL"]
    action = "accept"
    status = "enable"
    logtraffic = "utm"
    nat = "enable"
    ssl_ssh_profile = "no-inspection"
    capture_packet = "disable"
}


#### vpn policies for fortigate to fortigate vpn settings ####

resource "fortios_firewall_security_policy" "incoming_between_fortigates" {
    count = var.fortigate_to_fortigate != "" ? 1 : 0
    name = join("",[var.name , "-vpn"]) 
    srcintf = [var.vpn_incoming_port]
    dstintf = [var.vpn_outgoing_port]
    srcaddr = ["all",]
    dstaddr = ["all"]
    internet_service = "disable"
    schedule = "always"
    service = ["ALL"]
    action = "accept"
    status = "enable"
    logtraffic = "utm"
    nat = "enable"
    ssl_ssh_profile = "no-inspection"
    capture_packet = "disable"
}