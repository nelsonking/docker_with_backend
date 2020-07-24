#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container elk

es_port_map="-p 9200:9200"
kibana_port_map="-p 5601:5601"
log_port_map="-p 5044:5044"


es_data_dir="/opt/docker_with_backend/elasticsearch/data"
es_data_map="-v $es_data_dir:/var/lib/elasticsearch"

log_data_dir="/opt/docker_with_backend/logstash/data"
log_data_map="-v $log_data_dir:/opt/logstash/data"
log_config="/opt/docker_with_backend/logstash/logstash.config"
log_config_map="-v $log_config:/etc/logstash/conf.d/logstash.conf"

api_log_dir="/data/www/qjyedu-api/storage/logs"
api_log_map="-v $api_log_dir:/opt/data/web-api-log"

nginx_log_dir="/data/www/logs"
nginx_log_map="-v $nginx_log_dir:/opt/data/web-nginx-log"

echo $docker_run elk $es_port_map  $kibana_port_map $log_port_map $es_data_map $log_data_map $log_config_map $api_log_map sebp/elk

# 运行命令后需要进入到docker中重启一下logstash
