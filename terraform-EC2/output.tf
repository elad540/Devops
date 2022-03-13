output "private_ip" {
  description = "private ip"
  value = "${join(", ", aws_instance.ubuntu.*.private_ip)}"
}

output "publice_ip" {
  description = "Public IP address of the EC2 instance"
  value = "${join(", ", aws_instance.ubuntu.*.public_ip)}"
}

