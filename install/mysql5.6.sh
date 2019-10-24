#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container mysql5.6

# mysql 共享配置 (需要变更为真实环境)
mysql_data="/opt/docker_with_backend/mysql5.6/data"
mysql_config="/opt/docker_with_backend/mysql5.6/mysql.cnf"

mysql_data_map="-v $mysql_data:/var/lib/mysql"
mysql_config_map="-v $mysql_config:/etc/mysql/conf.d/mysql.cnf"
mysql_port_map="-p 3307:3306"
mysql_root_password="-e MYSQL_ROOT_PASSWORD=123456"

# 安装mysql
$docker_run mysql5.6 $mysql_data_map $mysql_config_map $mysql_port_map $mysql_root_password $use_network_alias mysql5.6 docker.io/mysql:5.6
