FROM jenkins/jenkins:lts-slim
ARG plugins='blueocean kubernetes ansible terraform docker-workflow'
# Pipelines with Blue Ocean UI and Kubernetes
RUN jenkins-plugin-cli --plugins ${plugins}