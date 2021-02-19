output "bucket_name" {
  description = "S3 Bucket name"
  value = "${module.s3_bucket.bucket_name}"
}

output "bucket_arn" {
  description = "S3 Bucket Arn"
  value = "${module.s3_bucket.bucket_arn}"
}

output "bucket_region" {
  description = "The AWS region this bucket resides in."
  value = "${module.s3_bucket.bucket_region}"
}