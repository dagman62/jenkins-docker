FROM dagman62/jenkins:2.118
USER root

WORKDIR /usr/local/bin

COPY docker docker

RUN groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins && \
 curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
 chmod +x /usr/local/bin/docker-compose

user jenkins
