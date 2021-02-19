output "bucket_name" {
  description = "S3 Bucket name"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "S3 Bucket Arn"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.main.region
}

