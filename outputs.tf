output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "security_group_id" {
  value = module.security_group.security_group_id
}