FROM jenkins/jenkins:lts-slim
#ARG TERRAFORM_VERSION=0.13.5
#ARG TERRAGRUNT_VERSION=0.25.5
ARG plugins='blueocean kubernetes ansible terraform docker-workflow locale'
# Pipelines with Blue Ocean UI and Kubernetes
USER root
RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN tee /etc/apt/sources.list.d/hashicorp.list

# Unzip
RUN \
apt update && apt install terraform \
# Check that it's installed
terraform --version
RUN jenkins-plugin-cli --plugins ${plugins}