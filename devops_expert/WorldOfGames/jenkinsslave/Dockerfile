FROM linuxserver/docker-compose
ARG packages='python3 pip wget unzip telnet iputils-ping'
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt -f install -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
COPY requirements requirements
RUN telnet
RUN pip install -r requirements