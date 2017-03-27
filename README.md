# elasticstack
ELK : elasticsearch + logstash + kibana

* Version : 5.0.1 + 5.0.1 + 5.0.1
* Version : 5.1.1 + 5.1.1 + 5.1.1
* Version : 5.x + 5.x + 5.x

Forwarder : filebeat port 5044

### Prerequisite
* OS : Centos 7.x
* Docker engine > 1.12.x
* Docker-compose > 1.11.x

### Clone GIT folder under your user home
    
    cd ~
    git clone https://github.com/easonlau02/elasticstack.git

## All 3 components(ELK) in one machine

#### Change below `~/elasticstack/.env` file only
    # ~/elasticstack/.env

    # environment propertiese, for distinguishing
    environment=prod

    # elascticsearch-image, change data path in host machine, default as /use/data/
    E_LOCAL_DATA_PATH=/usr/data/

    # logstash-image
    ## If docker-compose file set network_mode as host, can access elasticsearch via localhost. For 3 components are in one machine, need to set as localhost
    L_ELASTICSEARCH_HOST_ENV=localhost

    # kibana-image
    ## If docker-compose file set network_mode as host, can access elasticsearch via localhost ip. For 3 components are in one machine, need to set as localhost ip : 127.0.0.1 or 0.0.0.0
    K_ELASTICSEARCH_HOST_IP=127.0.0.1
#### For docker-compose file `~/elasticstack/docker-compose.yml`, no need chnage generally. You can see some field you config at above .env file will pass into container via docker-compose file.
    version: '2'
    services:
      elasticsearch:
        ...
        environment:
          - env=${environment}
        volumes:
          ...
          - ${E_LOCAL_DATA_PATH}:/usr/share/elasticsearch/data
          ...
        ...
      logstash:
        image: eason02/logstash:5.0.1
        ...
        environment:
          - env=${environment}
          ...
        ...
      kibana:
        ...
        environment:
          - env=${environment}
        extra_hosts:
          - "elasticsearchHost:*${K_ELASTICSEARCH_HOST_IP}*"
        ...
        
#### Startup ELK service at one machine
    cd ~/elaasticstack
    docker-compose up -d
    
## Not all 3 in one machine

#### Three .env you might change. But will simpler than before
`~/elasticstack/elasticsearch/.env`

    # ~/elasticstack/elasticsearch/.env

    # environment propertiese, for distinguishing
    environment=prod

    # elascticsearch-image, change data path in host machine, default as /use/data/
    E_LOCAL_DATA_PATH=/usr/data/
    
`~/elasticstack/logstash/.env`

    # ~/elasticstack/logstash/.env

    # environment propertiese, for distinguishing
    environment=prod

    # logstash-image
    ## Specify elasticsearch host, if the same machine, set it as localhost, if not, set specific host name. To make sure no firewall to access elasticsearch:9200
    L_ELASTICSEARCH_HOST_ENV=localhost

`~/elasticstack/kibna/.env`

    # ~/elasticstack/kibana/.env

    # environment propertiese, for distinguishing
    environment=prod

    # for kibana-image
    ## Specify elasticsearch host, if the same machine, set it as 127.0.0.0 or 0.0.0.0, if not, set specific host IP. To make sure no firewall to access elasticsearchIP:9200
    K_ELASTICSEARCH_HOST_IP=127.0.0.1

#### For docker-compose, every component will hold one, in order to start it single at one machine.
* [`~/elasticstack/elascticsearch/docker-compose.yml`](https://github.com/easonlau02/elasticstack/blob/master/elasticsearch/docker-compose.yml)
* [`~/elasticstack/logstash/docker-compose.yml`](https://github.com/easonlau02/elasticstack/blob/master/logstash/docker-compose.yml)
* [`~/elasticstack/kibana/docker-compose.yml`](https://github.com/easonlau02/elasticstack/blob/master/kibana/docker-compose.yml)
#### Startup ELK service at corresponding machine respectively.
**Elasticsearch at host1**:
    
    cd ~/elasticstack/elasticsearch
    docker-compose up -d
    
**Logstash at host2**:
    
    cd ~/elasticstack/logstash
    docker-compose up -d
    
**Kibana at host3**:

    cd ~/elasticstack/kibana
    docker-compose up -d

## Access kibana via `<kibanahost>:5601`, you can see below screenshot
![alt text](https://raw.githubusercontent.com/easonlau02/elasticstack/master/kibana_up.png "kibana_up")

You can see **Unable to fetch mapping. Do you have indices match...**, caused by no log feed.