#!/bin/bash

# platform and elk_version is required, is platform is mac, es_host is required, or'll no need es_host param
platform=$1
elk_version=$2
es_host=$3
docker_compose_file=./$elk_version/docker-compose.yml

#platform_list
version_list=(5.3.1 5.6.3 6.0.1 6.1.2)

echo $1 $2 $3
usage() {
	echo 'usage: ./up_service.sh <linux|mac> ' $version_list '<your_hostname>'
        exit 0
}

check_param(){
	if [ "$(echo $platform | tr [A-Z] [a-z] )" = "linux" ]; then
		echo $platform
	elif [ "$(echo $platform | tr [A-Z] [a-z])" = "mac" ]; then
		echo $platform
		if [ -n "$es_host" ]; then
			echo $es_host
		else
			usage
		fi
	else
		usage
	fi
        if echo "${version_list[@]}" |  grep -w "$elk_version" &>/dev/null ; then
                echo $elk_version
        else
                usage
        fi
}

replace_param_if_need() {
	if [ "$(echo $platform | tr [A-Z] [a-z])" = "mac" ]; then
                cat ./$elk_version/docker-compose.yml.docker_for_mac > $docker_compose_file
		sed -i -e 's/<your_es_host>/$es_host/g' $docker_compose_file
	elif [ "$(echo $platform | tr [A-Z] [a-z] )" = "linux" ]; then
		cat ./$elk_version/docker-compose.yml.linux > $docker_compose_file
	fi
}
up_service(){
	docker-compose -f ./$elk_version/docker-compose.yml up -d
}

check_param
replace_param_if_need
up_service
