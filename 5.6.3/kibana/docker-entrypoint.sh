#!/bin/bash

set -e

# Add kibana as command if needed
if [ "${1:0:1}" = '-' ]; then
        set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
# allow the container to be started with `--user`
if [ "$1" = 'kibana' -a "$(id -u)" = '0' ]; then
        if [ -e /etc/kibana/kibana.yml ]
	then
		rm /etc/kibana/kibana.yml
	fi
	
	if [ ! -e /etc/kibana/kibana.yml.org ]
	then
		echo "Please mount kibana.yml file to /etc/kibana/kibana.yml.org"
	else
		echo "Found kibana.yml.org, copy one and replace elasticsearch url"
	   	cp /etc/kibana/kibana.yml.org /etc/kibana/kibana.yml
		sed -i 's/elasticsearchHost/'`echo $elasticsearchHost`'/g' /etc/kibana/kibana.yml
        fi
        set -- gosu kibana "$@"
fi

# As argument is not related to kibana,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
