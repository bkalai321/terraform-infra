# AWS VPN Module


## How to use this module

Configure the aws vpn with all required variables:

```
provider "aws" {
  region = "us-east-1"
}

module "vpn" {
  source        = "../../../aws/vpn"

}
```
