FROM linuxserver/docker-compose
ARG packages='python3 pip wget unzip'
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
RUN apt -f install -y
RUN apt-get install -y ${packages}
RUN apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
COPY requirements requirements
RUN pip3 install -r requirements
##============================================
## Google Chrome
##============================================
#ARG CHROME_VERSION="google-chrome-stable"
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
#  && apt-get update -qqy \
#  && apt-get -qqy install \
#    ${CHROME_VERSION:-google-chrome-stable} \
#  && rm /etc/apt/sources.list.d/google-chrome.list \
#  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
#
##=================================
## Chrome Launch Script Wrapper
##=================================
#COPY wrap_chrome_binary /opt/bin/wrap_chrome_binary
#RUN chmod +x /opt/bin/wrap_chrome_binary
#RUN /opt/bin/wrap_chrome_binary
#
#USER root
#
##============================================
## Chrome webdriver
##============================================
## can specify versions by CHROME_DRIVER_VERSION
## Latest released version will be used by default
##============================================
#ARG CHROME_DRIVER_VERSION
#RUN mkdir '/opt/selenium'
#WORKDIR /opt/selenium
#RUN if [ -z "$CHROME_DRIVER_VERSION" ]; \
#  then CHROME_MAJOR_VERSION=$(google-chrome --version | sed -E "s/.* ([0-9]+)(\.[0-9]+){3}.*/\1/") \
#    && NO_SUCH_KEY=$(curl -ls https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR_VERSION} | head -n 1 | grep -oe NoSuchKey) ; \
#    if [ -n "$NO_SUCH_KEY" ]; then \
#      echo "No Chromedriver for version $CHROME_MAJOR_VERSION. Use previous major version instead" \
#      && CHROME_MAJOR_VERSION=$(expr $CHROME_MAJOR_VERSION - 1); \
#    fi ; \
#    CHROME_DRIVER_VERSION=$(wget --no-verbose -O - "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR_VERSION}"); \
#  fi \
#  && echo "Using chromedriver version: "$CHROME_DRIVER_VERSION \
#  && wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
#  && rm -rf /opt/selenium/chromedriver \
#  && unzip /tmp/chromedriver_linux64.zip -d /opt/selenium \
#  && rm /tmp/chromedriver_linux64.zip \
#  && mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
#  && chmod 755 /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
#  && ln -fs /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver
#
#
##============================================
## Dumping Browser name and version for config
##============================================
#RUN echo "chrome" > /opt/selenium/browser_name
