# Docker, java, sbt Dockerfile

FROM gitlab/dind:latest

RUN  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
     apt-get update && \
     apt-get install -y curl && \
     apt-get install -y software-properties-common python-software-properties && \
     add-apt-repository -y ppa:webupd8team/java && \
     apt-get update && \
     apt-get install -y oracle-java8-installer && \
     rm -rf /var/lib/apt/lists/* && \
     rm -rf /var/cache/oracle-jdk8-installer && \
     apt-get update -yqq && \
     apt-get install apt-transport-https -yqq && \
     echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
     apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
     apt-get update -yqq && \
     apt-get install sbt -yqq

WORKDIR /root