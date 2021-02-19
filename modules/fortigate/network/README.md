## Fortigate official documents for interface details
https://help.fortinet.com/cli/fos60hlp/60/Content/FortiOS/fortiOS-cli-ref/config/system/interface.htm


## How to use this module

Configure the fortigate vpn with all required variables:

```
provider "fortios" {
  hostname = var.fortios_host
  insecure = true
  token    = var.fortios_token
}

module "fortigate" {
  source        = "../../../fortigate"

}
```
