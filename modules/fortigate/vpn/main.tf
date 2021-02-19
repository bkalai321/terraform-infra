###################
# Fortigate VPN tunnel
###################

resource "fortios_vpn_ipsec_phase1interface" "this" {
    name = var.name
    type = "static"
    interface = "wan1"
    peertype = "any"
    proposal = "aes256-sha256"
    remote_gw = var.remote_gw
    wizard_type = "custom"
    psksecret = var.psksecret
    authmethod = "psk"
    authmethod_remote = ""
    mode_cfg = "disable"
}


resource "fortios_vpn_ipsec_phase2interface" "this" {
    name = var.name
    phase1name = fortios_vpn_ipsec_phase1interface.this.name
    proposal = "aes256-sha256"
    src_addr_type = "subnet"
    dst_addr_type = "subnet"
    src_start_ip = "0.0.0.0"
    src_end_ip = "0.0.0.0"
    src_subnet = "0.0.0.0 0.0.0.0"
    dst_start_ip = "0.0.0.0"
    dst_end_ip = "0.0.0.0"
    dst_subnet = "0.0.0.0 0.0.0.0"
}