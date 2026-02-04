# Generate private key locally
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS Key Pair
resource "aws_key_pair" "keypair" {
  key_name   = "terraform-module-key"
  public_key = tls_private_key.key.public_key_openssh
}

# Save .pem file locally
resource "local_file" "pem" {
  filename = "terraform-module-key.pem"
  content  = tls_private_key.key.private_key_pem
  file_permission = "0400"
}

# Security Group for SSH
resource "aws_security_group" "ssh_sg" {
  name = "module-ssh-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "this" {
  ami           = "ami-0e86e20dae9224db8"   # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type
  key_name      = aws_key_pair.keypair.key_name
  security_groups = [aws_security_group.ssh_sg.name]

  tags = {
    Name = var.instance_name
  }
}
