# From elk env basic
FROM eason02/java:1.8

# Maintainer
MAINTAINER eason.lau02@hotmail.com

COPY ./logstash.repo /etc/yum.repos.d/logstash.repo

# Install logstash componment
RUN set -x && \
        yum -y install which && \
        yum -y install openssl && \
        rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && \
        yum -y install logstash && \
        rm -rf /etc/logstash/* && \
        ls -R /etc/logstash

COPY ./config/ /etc/logstash/

RUN ls -R /etc/logstash/

ENV PATH  /usr/share/logstash/bin:$PATH
ENV LS_SETTINGS_DIR /etc/logstash

# COPY ./config /usr/share/logstash/config/
# COPY ./conf.d /etc/logstash/conf.d/

RUN set -x && \
        chown logstash:root /var/log/logstash && \
        ls -ltr /var/log/ && \
        echo securerandom.source=file:/dev/urandom >> /usr/java/jdk1.8.0_112/jre/lib/security/java.security

COPY ./tls/certs/logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt
COPY ./tls/private/logstash-forwarder.key /etc/pki/tls/private/logstash-forwarder.key

RUN ls -R /etc/pki/tls/certs/ && ls -R /etc/pki/tls/private/

# Generate cert
# RUN cd /etc/pki/tls && \
#        openssl req -subj '/CN=<your logstash host domain>/' -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt

EXPOSE 5000
VOLUME /var/log/logstash
# VOLUME /etc/pki/tls/private
# VOLUME /etc/pki/tls/certs
# VOLUME /etc/logstash
CMD ["logstash"]