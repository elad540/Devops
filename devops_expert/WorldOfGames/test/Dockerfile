FROM selenium/standalone-chrome
FROM linuxserver/docker-compose
ARG packages='python3 pip wget'
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt -f install -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
COPY ../score/requirements requirements
RUN pip3 install -r requirements