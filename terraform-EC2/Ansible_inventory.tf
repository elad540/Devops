resource "null_resource" "after_aws_instance" {
  triggers = {
    always_run = "${timestamp()}"
  }
  depends_on = [aws_instance.ubuntu]
  #delete Ansible Inventory when destroy
  provisioner "local-exec" {
    command = "rm -rf ./ansible && mkdir ansible && echo  \"[EC2_hosts]\" > ./ansible/hosts && terraform output -raw hosts_names >> ./ansible/hosts"
  }
  #  #Create Ansible Inventory
  #  provisioner "local-exec" {
  #    command =  "echo  \"[EC2_hosts]\" > ./ansible/hosts"
  #  }
  #Create Ansible Inventory
  provisioner "local-exec" {
    command =  "rm -rf ./ansible"
    when = destroy
  }
#  #add hosts name to Ansible Inventory
#  provisioner "local-exec" {
#    command = "terraform output -raw hosts_names >> ./ansible/hosts"
#    when = create
#  }
}