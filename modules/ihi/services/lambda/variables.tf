variable "aws_region" {
  default = "us-east-1"
}

variable description {
  description = "description of lambda function"
  default = "Lambda function deployed using terraform"
} 

variable aws_s3_bucket_name {
  description = "aws s3 bucket name contains lambda function zip"
}

variable aws_s3_bucket_key {
  description = "aws lambda function zip file name with complete path"
}

variable function_name {
  description = "name of lambda function"
}

variable handler {
  description = "lambda handler name"
  default = "lambda_handler"
}
variable runtime {
  description = "lambda runtime. can be python, go, node or java"
}

variable layers {
  type = list(string)
  default = []
}

variable subnet_ids {
  description = "subnet ids for lambda function"
  type = list(string)
  default = []
}
variable security_group_ids {
  description = "sucurity group id for lambda function"
  type = list(string)
  default = []
}

variable tags {
  description = "tags for lambda function"
  type = map(string)
  default = {}
}

variable environment {
  description = "environment variable for lambda function"
  type = map(string)
  default = {"key":"value"}
}

