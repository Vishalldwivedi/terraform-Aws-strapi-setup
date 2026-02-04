output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "pem_file_path" {
  value = module.ec2.pem_path
}
