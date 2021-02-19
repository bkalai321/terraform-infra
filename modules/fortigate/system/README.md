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


