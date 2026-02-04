# terraform-Aws-strapi-setup
# 🚀 DevOps Assignment — EC2 + Terraform + Strapi

## 📌 Task Overview  

This repository contains the implementation of the following tasks:

1. **Provision an AWS EC2 instance using Terraform with a modular structure.**  
2. **Automatically generate and manage a `.pem` key file through Terraform.**  
3. **SSH into the EC2 instance using the generated key.**  
4. **Install required dependencies and run a Strapi application on the EC2 instance.**  
5. **Record a Loom video demonstrating the complete process.**  
6. **Push the code to GitHub and raise a Pull Request.**  
7. **Submit task progress in the submission channel.**

---

## 🗂️ Repository Structure  

terraform-ec2-project/
│── main.tf
│── variables.tf
│── outputs.tf
│── providers.tf
│
└── modules/
└── ec2/
├── main.tf
├── variables.tf
└── outputs.tf

aws config -> access key secrete access key so that we can connect to aws terraform and aws can communicate 

terraform init 
terraform plan 
terraform apply 

ssh -i terraform-module-key.pem ec2-user@<PUBLIC_IP>

git clone https://github.com/<your-username>/strapi.git
cd strapi

curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
node -v
npm -v

npm install
npm run develop
