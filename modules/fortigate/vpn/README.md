# AWS VPN Module


# Security practices followed
1. We should use proposal security AES-256 and SHA-256
2. Pre-shared key should be hashed in Jenkins
3. Fortigate Token should be secure
4. Enable Perfect Forward Secrecy (PFS) between the tunnels.
5. Diffie-Hellman Group should be higher - 5 
6. Key Lifetime should be 3600
7. After VPN tunnel creation you need to create incoming and outgoing policy.
  Incoming policies:
    a. Incoming Interface : Tunnel name
    b. Outgoing Interface : Internal
    c. Source: ALL
    d. Destination: ALL
    e. Action: Accept
    f. Log Allowed Traffic: All Sessions
  Outgoing policies:
    a. Incoming Interface : Internal
    b. Outgoing Interface : Tunnel name
    c. Source: ALL
    d. Destination: ALL
    e. Action: Accept
    f. Log Allowed Traffic: All Sessions
8. Static Routes for VPN tunnels should be created as per tunnel private CIDR.


# Static Routes
1. blackhole should be disabled.
2. Distance should be 10
3. Weight and priority should be 0 for all the static routes of VPN tunnel.

# Policies
1. internet_service = "disable"
3. schedule = "always"
    service = []
    action = "accept"
  utm_status = "disable"
    logtraffic = "all"
    logtraffic_start = "enable"
    capture_packet = "enable"
    ippool = "enable"
    poolname = ["rewq", "rbb"]
    groups = ["Guest-group", "SSO_Guest_Users"]
    devices = ["android-phone", "android-tablet"]
    comments = "security policy"
    av_profile = "wifi-default"
    webfilter_profile = "monitor-all"
    dnsfilter_profile = "default"
    ips_sensor = "protect_client"
    application_list = "block-high-risk"
    ssl_ssh_profile = "certificate-inspection"
    nat = "enable"

## How to use this module

Configure the fortigate vpn with all required variables:

```
provider "fortios" {
  hostname = var.fortios_host
  insecure = true
  token    = var.fortios_token
}

module "fortigate_vpn" {
  source        = "../../../fortigate/vpn"

}
```


