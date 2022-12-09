FROM linuxserver/docker-compose
ARG packages='python3 pip wget'
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install ./google-chrome-stable_current_amd64.deb -y
COPY requirements requirements
RUN pip3 install -r requirements