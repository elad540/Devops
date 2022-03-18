############################################################################################################
## Terraform Script to setup VM on AWS, Find ami ID in AWS Marketplace, using "Ubuntu Server 20.04 LTS"
# Build AWS Access Key
# Terraform  initialize the Environment, "terraform init"
# Terraform Check Script Before Run, "terraform plan" or Use "terraform plan -out terraform_plan_Backup.tfplan"
# Terraform Run Script, "terraform apply" Or Use "terraform apply terraform_plan_Backup.tfplan" Without Approval Promote for Automation
# Terraform Destroy Environment, "terraform destroy" Or Use "terraform destroy -auto-approve" Without Approval Promote for Automation
############################################################################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  count         = 2  #change to create more instances
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  tags = {
    Name = "ubuntu_20.04_server_${count.index + 1}"
  }
}

resource "null_resource" "after_aws_instance" {
  depends_on = [aws_instance.ubuntu]
  #Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo  \"[EC2_hosts]\" > ./ansible/hosts"
  }
  #add public hosts to hosts file
  provisioner "local-exec" {
    command = "terraform output -json hosts_names >> ./ansible/hosts"
  }
}
variable "credentials_files" {
  type    = list(string)
}
variable "config_files" {
  type    = list(string)
}

variable "security_token" {
  type    = string
}

variable "session_token" {
  type    = string
}
variable "region" {
  type = string
}
variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}