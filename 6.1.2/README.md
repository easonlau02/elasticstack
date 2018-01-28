# elasticstack
ELK : elasticsearch + logstash + kibana

* Version : 6.1.2

Forwarder : filebeat port 5044

### Prerequisite
* OS : Centos 7.x
* Docker engine > 1.12.x
* Docker-compose > 1.11.x

### Clone GIT folder under your user home
    
    cd ~
    git clone https://github.com/easonlau02/elasticstack.git

## All 3 components(ELK) in one machine

### Change config if you are using docker-for-mac under MAC
* Replace <your_es_host> with your running host
#### Startup ELK service at one machine
* For linux user
```bash
cd ~/elaticstack/6.1.2
docker-compose up -d
```
* For Mac user
```bash
cd ~/elasticstack/6.1.2
docker-compose -f docker-compose.yml.docker_for_mac up -d
```
    
## Access kibana via `<kibanahost>:5601`, you can see below screenshot
![alt text](https://raw.githubusercontent.com/easonlau02/elasticstack/master/6.1.2/kibana_up.png "kibana_up")

You can see **Unable to fetch mapping. Do you have indices match...**, caused by no log feed.
