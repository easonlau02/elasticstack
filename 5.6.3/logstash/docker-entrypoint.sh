#!/bin/bash

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
        set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
# allow the container to be started with `--user`
if [ "$1" = 'logstash' -a "$(id -u)" = '0' ]; then
        echo Select config by \$L_CONF_PROJECT_KEY
        if [ $L_CONF_PROJECT_KEY ]; then
		echo L_CONF_PROJECT_KEY=$L_CONF_PROJECT_KEY
		echo Remove default base config and copy \/etc\/logstash\/conf.d\/$L_CONF_PROJECT_KEY\/
		if [ -e /etc/logstash/conf.d/$L_CONF_PROJECT_KEY ]; then
			rm -rf /etc/logstash/conf.d/*.conf
			ls -ltr /etc/logstash/conf.d/
		        cp /etc/logstash/conf.d/$L_CONF_PROJECT_KEY/*.conf /etc/logstash/conf.d/
		else
			echo key value $L_CONF_PROJECT_KEY do not support, use default.
			rm -rf /etc/logstash/conf.d/*.conf
			cp /etc/logstash/conf.d/default/*.conf /etc/logstash/conf.d/
		fi
                ls -ltr /etc/logstash/conf.d/
	else
		echo Not provide key L_CONF_PROJECT_KEY, use default
		rm -rf /etc/logstash/conf.d/*.conf
                cp /etc/logstash/conf.d/default/*.conf /etc/logstash/conf.d/
		ls -ltr /etc/logstash/conf.d/
	fi
        export JAVA_HOME=/usr/java/jdk1.8.0_112/
	echo $JAVA_HOME
        set -- gosu logstash "$@"
fi

# As argument is not related to logstash,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
