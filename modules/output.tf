output "public_ip" {
  value = aws_instance.this.public_ip
}

output "pem_path" {
  value = local_file.pem.filename
}
