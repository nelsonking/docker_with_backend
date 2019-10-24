#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container php
check_container nginx


# 代码共享配置 (需要变更为真实环境)
code_dir="/data/www"
code_dir_map="-v $code_dir:/web"

# nginx 共享配置 (需要变更为真实环境)
nginx_config="/opt/docker_with_backend/nginx/nginx.conf"
nginx_config_d="/opt/docker_with_backend/nginx/conf.d"

nginx_config_map="-v $nginx_config:/etc/nginx/nginx.conf -v $nginx_config_d:/etc/nginx/conf.d"
nginx_port_map="-p 80:80 -p 443:443"


# 安装php
$docker_run php $code_dir_map $use_network_alias php docker.io/php:7.3-fpm

# 安装nginx
$docker_run nginx $code_dir_map $nginx_config_map $nginx_port_map $use_network_alias nginx nginx:latest
