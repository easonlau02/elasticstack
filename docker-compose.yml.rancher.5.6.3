elkconfiguredata:
  labels:
    io.rancher.container.pull_image: always
  image: eason02/elk-data-volume:latest
  volumes:
    - /etc/kibana/
    - /etc/logstash/
    - /usr/share/elasticsearch/config/
    - /usr/share/kibana/plugins/
  command:
    - tail
    - -f
    - /etc/logstash/logstash.yml
elasticsearch:
  image: eason02/elasticsearch:5.6.3
  container_name: elasticsearch-5.6.3
  restart: always
  net: host
  environment:
    - env=QA
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: stack=elk
    io.rancher.sidekicks: elkconfiguredata
  ports:
    - "9200:9200"
    - "9300:9300"
  volumes_from:
    - elkconfiguredata
  volumes:
    - ./elasticsearch/logs/:/usr/share/elasticsearch/logs
    - ./elasticsearch/data/:/usr/share/elasticsearch/data
logstash:
  image: eason02/logstash:5.6.3
  container_name: logstash-5.6.3
  restart: always
  net: host
  environment:
    - env=QA
    - L_ELASTICSEARCH_HOST=localhost
    - L_CONF_PROJECT_KEY=default
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: stack=elk
    io.rancher.sidekicks: elkconfiguredata
  ports:
    - "5044:5044"
  volumes_from:
    - elkconfiguredata
  volumes:
    - ./logstash/logs/:/var/log/logstash
kibana:
  image: eason02/kibana:5.6.3
  container_name: kibana-5.6.3
  restart: always
  net: host
  environment:
    - env=QA
    - elasticsearchHost=localhost
  labels:
    io.rancher.container.pull_image: always
    io.rancher.scheduler.affinity:host_label: stack=elk
    io.rancher.sidekicks: elkconfiguredata
  ports:
    - "5601:5601"
  volumes_from:
    - elkconfiguredata
