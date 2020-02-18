#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container php
#check_container nginx


# 代码共享配置 (需要变更为真实环境)
code_dir="/data/www"
code_dir_map="-v $code_dir:/web"

# php 共享配置
php_config="/opt/docker_with_backend/php/php.ini"
php_config_map="-v $php_config:/usr/local/etc/php/php.ini"

# nginx 共享配置 (需要变更为真实环境)
nginx_config="/opt/docker_with_backend/nginx/nginx.conf"
nginx_config_d="/opt/docker_with_backend/nginx/conf.d"

nginx_config_map="-v $nginx_config:/etc/nginx/nginx.conf -v $nginx_config_d:/etc/nginx/conf.d"
nginx_port_map="-p 80:80 -p 443:443"

# php 指定用户 1000 => www-data
with_user="--user 1000"

# 安装php
$docker_run php $with_user $code_dir_map $use_network_alias php docker.io/php:7.4-fpm

# 安装nginx
#$docker_run nginx $code_dir_map $nginx_config_map $nginx_port_map $use_network_alias nginx docker.io/nginx:latest

# php 安装扩展
docker exec --user root php docker-php-ext-install pdo pdo_mysql

docker restart php
