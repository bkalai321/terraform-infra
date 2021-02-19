# output "id" {
#   value = coalesce(
#     element(concat(aws_elb.http.*.id, [""]), 0),
#     element(concat(aws_elb.https.*.id, [""]), 0),
#   )
# }

# output "arn" {
#   value = coalesce(
#     element(concat(aws_elb.http.*.arn, [""]), 0),
#     element(concat(aws_elb.https.*.arn, [""]), 0),
#   )
# }

# output "name" {
#   value = coalesce(
#     element(concat(aws_elb.http.*.name, [""]), 0),
#     element(concat(aws_elb.https.*.name, [""]), 0),
#   )
# }

# output "dns_name" {
#   value = coalesce(
#     element(concat(aws_elb.http.*.dns_name, [""]), 0),
#     element(concat(aws_elb.https.*.dns_name, [""]), 0),
#   )
# }


output "name" {
  value = aws_elb.http.*.name
}

output "id" {
  value = aws_elb.http.*.id
}

output "arn" {
  value = aws_elb.http.*.arn
}

output "dns_name" { 
  value = aws_elb.http.*.dns_name
}