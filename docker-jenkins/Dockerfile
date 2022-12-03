#after push run "kubectl rollout restart deployment/jenkins"
FROM jenkins/jenkins:lts-slim
ARG peckges='apt-utils unzip wget vim'
ARG plugins='blueocean kubernetes ansible terraform docker-plugin locale configuration-as-code'
ARG jenkins_url='192.168.49.2'
ARG jenkins_port='32000'
USER root
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt-get install -y ${peckges}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
#RUN mkdir -p /scripts
#COPY jenkins_update.sh .
##RUN curl http://${jenkins_url}:${jenkins_port}/jnlpJars/jenkins-cli.jar --output /opt/jenkins-cli.jar
##ARG UPDATE_LIST=$(java -jar /opt/jenkins-cli.jar -s http://${jenkins_url}:${jenkins_port}/ -auth "admin:admin" -noKeyAuth list-plugins | grep -e ')$' | awk '{ print $1 }' );
#RUN chmod +x jenkins_update.sh
#RUN ./jenkins_update.sh
RUN jenkins-plugin-cli --plugins ${plugins}