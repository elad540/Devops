#after push run "kubectl rollout restart deployment/jenkins"
FROM jenkins/jenkins:lts-slim
ARG packages='apt-utils unzip wget vim'
ARG plugins='blueocean kubernetes ansible terraform docker-plugin locale configuration-as-code docker-slaves docker-workflow docker-build-step'
ARG jenkins_url='192.168.49.2'
ARG jenkins_port='32000'
USER root
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
# RUN mkdir -p /scripts
# COPY jenkins_update.sh .
# RUN chmod +x jenkins_update.sh
# RUN . /jenkins_update.sh
RUN jenkins-plugin-cli --plugins ${plugins}