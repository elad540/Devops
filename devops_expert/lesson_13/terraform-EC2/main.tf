############################################################################################################
## Terraform Script to setup VM on AWS, Find ami ID in AWS Marketplace, using "Ubuntu Server 22.04 LTS"
# Build AWS Access Key
# Terraform  initialize the Environment, "terraform init"
# Terraform Check Script Before Run, "terraform plan" or Use "terraform plan -out terraform_plan_Backup.tfplan"
# Terraform Run Script, "terraform apply" Or Use "terraform apply terraform_plan_Backup.tfplan" Without Approval Promote for Automation
# Terraform Destroy Environment, "terraform destroy" Or Use "terraform destroy -auto-approve" Without Approval Promote for Automation
# Destroy a specific instance "Terraform destroy -target aws_instance.ubuntu[ENTER_INDEX_OF_instance(name num-1)]"
############################################################################################################

data "aws_subnet" "selected" {
  id = "subnet-01005d3f0bc5cee48"
  vpc_id = "vpc-0b7dd21e7f07d0ecb"
}

resource "aws_security_group" "subnet" {
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    cidr_blocks = [data.aws_subnet.selected.cidr_block]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
    ingress {
    cidr_blocks = [data.aws_subnet.selected.cidr_block]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
}

resource "aws_instance" "ubuntu" {
  count         = var.amount_of_instance  #change to create more instances
  ami           = "ami-0caef02b518350c8b"
  security_groups = [aws_security_group.subnet.name]
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  #https://stackoverflow.com/questions/64785020/why-is-userdata-not-working-in-my-terraform-code
  user_data = file("templates/ubuntu.sh")
  tags = {
    Name = "ubuntu_22.04_${count.index + 1}"
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because of a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
      # and instance type.
      instance_type
    ]
  }
}
