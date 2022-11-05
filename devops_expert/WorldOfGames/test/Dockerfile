FROM linuxserver/docker-compose
RUN apt update -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y
RUN apt install python3 pip -y
COPY requirements requirements
RUN pip3 install -r requirements