provider "aws" {
  region = var.aws_region
}


module "lambda" {
  source      = "../../../aws/lambda"
  description   = var.description
  aws_s3_bucket_name = var.aws_s3_bucket_name
  aws_s3_bucket_key = var.aws_s3_bucket_key
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime

  vpc_config = {
    subnet_ids         = var.subnet_ids
    security_group_ids =  var.security_group_ids
  }

  layers = var.layers   

  tags = var.tags

  environment = {
    variables = var.environment
  }
}