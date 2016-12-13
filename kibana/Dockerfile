# From elk basic env
FROM eason02/java:1.8

# Maintainer
MAINTAINER eason.lau02@hotmail.com

COPY ./kibana.repo /etc/yum.repos.d/kibana.repo

# Install kibana
RUN  set -x && \
     cd ~ && \
     yum -y install which && \
     rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && \
     yum -y install kibana && \
     rm -rf /etc/kibana/*

# COPY ./config/ /etc/kibana/

ENV PATH /usr/share/kibana/bin:$PATH
EXPOSE 5601

VOLUME /etc/kibana/kibana.yml

CMD ["kibana"]
