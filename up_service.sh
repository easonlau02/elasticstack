#!/bin/bash

# platform and elk_version is required, is platform is mac, es_host is required, or'll no need es_host param
platform=$1
elk_version=$2
es_host=$3

#platform_list
version_list=(5.3.1 5.6.3 6.0.1 6.1.2)


usage() {
	echo 'usage: ./up_service.sh <linux|mac> ' $version_list '<your_hostname>'
}
echo $platform $(echo $platform | tr [A-Z] [a-z])
if [[ '$(echo $platform | tr [A-Z] [a-z] )' == 'linux' ]]; then
	echo $platform
elif [[ '$(echo $platform | tr [A-Z] [a-z])' == 'mac' ]]; then
	echo $platform
else
	usage
fi
