FROM jenkins/jenkins:lts-slim
ARG peckges='apt-utils unzip wget vim'
ARG plugins='blueocean kubernetes ansible terraform docker-plugin locale'
USER root
RUN apt update -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y
RUN apt-get install -y ${peckges}
RUN jenkins-plugin-cli --plugins ${plugins}