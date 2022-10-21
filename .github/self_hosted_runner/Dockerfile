FROM ubuntu:latest
ARG GH_ACTIONS_RUNNER_VERSION=2.298.2
ARG PACKAGES="gnupg2 apt-transport-https ca-certificates software-properties-common pwgen git make curl wget zip libicu-dev build-essential libssl-dev"
RUN useradd -d /actions-runner --uid=1000 runner && echo 'runner:runner' | chpasswd && mkdir /actions-runner \
&& chown -R runner:runner /actions-runner
WORKDIR /actions-runner
RUN apt-get update && apt-get install -y -q ${PACKAGES}  && apt-get clean && rm -rf /var/lib/apt/lists/*
USER runner
RUN curl -o actions-runner-linux-x64-${GH_ACTIONS_RUNNER_VERSION}.tar.gz -L \
https://github.com/actions/runner/releases/download/v${GH_ACTIONS_RUNNER_VERSION}/actions-runner-linux-x64-${GH_ACTIONS_RUNNER_VERSION}.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${GH_ACTIONS_RUNNER_VERSION}.tar.gz
USER root
RUN ./bin/installdependencies.sh
COPY start.sh .
USER runner
CMD ./start.sh