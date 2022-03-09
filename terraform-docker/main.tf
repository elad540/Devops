terraform {
required_providers {
  docker = {
    source  = "kreuzwerker/docker"
    version = "2.16.0"
  }
}
}
provider "docker" {
#registry_auth {
#  address  = "https://login.docker.com/"
#  username = "shaharco99@gmail.com"
# password = "shahar1804"
# }
}
resource "docker_image" "nginx" {
    name         = "nginx:latest"
    keep_locally = false
}

resource "docker_network" "private_network" {
  name   = "MyNet"
  driver = "bridge"
  }

resource "docker_container" "nginx" {
image  = docker_image.nginx.latest
name   = "ansible"
attach = false
must_run = true
network_mode = "MyNet"
  ports {
    internal = 8080
    external = 8000
  }
  networks_advanced {
    name = docker_network.private_network.name
    #ipv4_address = "192.168.144.2"
  }
}