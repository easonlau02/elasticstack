# elasticstack
ELK : elasticsearch + logstash + kibana

Version : 5.0.1 + 5.0.1 + 5.0.1

Forwarder : filebeat port 5400

### IMPORTANT TIPS: Suggest to copy git folder structure under path ${HOME}/

    git clone https://github.com/easonlau02/elasticstack.git

### You can change the docker-comopose file config if you are preferred.
    1. for single component:
    
    ${HOME}/elasticstack/elasticsearch/docker-compose.yml
    ${HOME}/elasticstack/logstash/docker-compose.ynl
    ${HOME}/elasticstack/kibana/docker-compose.yml
    
    2. for whole set of ELK: 
    
    2-1. copy docker-compose_qa.yml as default file docker-compose.yml
    
       cp ${HOME}/elasticstack/docker-compose_qa.yml ${HOME}/elasticstack/docker-compose.yml
       
    2-2. change related config as you needed. eg: image version/ mount point path/
    
       change config under below folder, eg: qa env
       		${HOME}/elasticstack/elasticsearch/config/qa
       		${HOME}/elasticstack/logstash/config/qa
       		${HOME}/elasticstack/kibana/config/qa
       change running version (now support 5.0.1 and 5.1.1(the latest one))
    
    3. Running whole set of ELK

        cd ${HOME}/elasticstack/
        docker-compose up -d
        docker ps
    

## Elasticsearch 5.1

Docker solution for elasticsearch provided by [elastic.co](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html), a highly scalable open-source full-text search and analytics engine. It allows you to store, search, and analyze big volumes of data quickly and in near real time

## Logstash 5.1

Docker solution for Logstash provided by [elastic.co](https://www.elastic.co/guide/en/logstash/current/index.html), an open source data collection engine with real-time pipelining capabilities. Logstash can dynamically unify data from disparate sources and normalize the data into destinations of your choice.

## Kibana 5.1


Docker solution for Kibana provided by [elastic.co](https://www.elastic.co/guide/en/kibana/current/index.html), an open source analytics and visualization platform designed to work with Elasticsearch. You use Kibana to search, view, and interact with data stored in Elasticsearch indices. 
