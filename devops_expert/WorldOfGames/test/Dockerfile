FROM linuxserver/docker-compose
RUN apt update --fix-missing -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y
RUN apt install python3 pip wget -y
COPY requirements requirements
RUN pip3 install -r requirements
CMD python e2e.py