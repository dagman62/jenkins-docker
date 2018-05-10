FROM jenkins
USER root

WORKDIR /tmp

RUN wget https://updates.jenkins-ci.org/latest/jenkins.war && \
  mv /tmp/jenkins.war /usr/share/jenkins && \
  rm -f /tmp/jenkins.war 

RUN ARCH=`uname -m` && \ 
 mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/${ARCH}/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins && \
 curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
 chmod +x /usr/local/bin/docker-compose

user jenkins
