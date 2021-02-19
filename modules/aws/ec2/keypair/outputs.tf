output "aws_key_pair_name" {
  value = aws_key_pair.my_key.key_name
}

output "aws_key_pair_fingerprint" {
  value = aws_key_pair.my_key.fingerprint
}

