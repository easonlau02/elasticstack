# elasticstack
ELK : elasticsearch + logstash + kibana

* Version : [5.0.1](https://github.com/easonlau02/elasticstack/tree/master/5.0.1)
* Version : [5.3.1](https://github.com/easonlau02/elasticstack/tree/master/5.3.1)
* Version : [5.6.3](https://github.com/easonlau02/elasticstack/tree/master/5.6.3)
* Version : [6.0.0](https://github.com/easonlau02/elasticstack/tree/master/6.0.0)
* Version : [6.1.2](https://github.com/easonlau02/elasticstack/tree/master/6.1.2)

Forwarder : filebeat port 5044

### Prerequisite

* OS : Centos 7.x
* Docker engine > 1.12.x
* Docker-compose > 1.11.x

### Clone GIT folder under your user home
    
    cd ~
    git clone https://github.com/easonlau02/elasticstack.git

### Now support 4 version for you to choose below way to up service: 5.3.1/5.6.3/6.0.0/6.1.2, below take version 6.1.2 for example:
### Change config if you are using docker-for-mac under MAC
* Replace <your_es_host> with your running host for below config
```bash
~/elasticstack/6.1.2/docker-compose.yml.docker_for_mac
```
### Startup ELK service at one machine
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
    
### Access kibana via `<kibanahost>:5601`, you can see below screenshot

![alt text](https://raw.githubusercontent.com/easonlau02/elasticstack/master/6.0.0/kibana_up_status.png "kibana_up_status.png")
![alt text](https://raw.githubusercontent.com/easonlau02/elasticstack/master/6.1.2/kibana_up.png "kibana_up")

You can see **Unable to fetch mapping. Do you have indices match...**, caused by no log feed.
