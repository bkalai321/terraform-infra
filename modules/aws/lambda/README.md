# Lambda Module


## How to use this module

Configure the Lambda function with all required variables:

```
provider "aws" {
  region = "us-east-1"
}

module "lambda" {
  source        = "../../../aws/lambda"
  s3_bucket     = "s3_bucket_name"
  s3_key        = "/path/my-package.zip"
  function_name = "my-function"
  handler       = "my-handler"
  runtime       = "go1.x"
}
```
