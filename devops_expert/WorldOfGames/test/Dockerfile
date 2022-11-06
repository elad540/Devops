FROM linuxserver/docker-compose
RUN apt update -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y
RUN apt install python3 pip unzip wget -y
COPY requirements requirements
RUN wget https://chromedriver.storage.googleapis.com/107.0.5304.62/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN pip3 install -r requirements