output "certificateArn" {
  description = "Arn of the certificate. This needs to be created just as one step or using route53"
  value       = data.aws_acm_certificate.myCert.arn
}

