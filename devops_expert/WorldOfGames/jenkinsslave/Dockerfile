FROM linuxserver/docker-compose
ARG packages='python3 pip wget unzip python3.8-venv'
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt -f install -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
COPY requirements requirements
RUN python3 -m venv wog-env
RUN chmod +x wog-env/bin/activate
RUN . wog-env/bin/activate && python3 -m pip install --upgrade pip && python3 -m pip install -r requirements
