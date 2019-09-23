#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container gitlab

# 代码共享配置 (需要变更为真实环境)
gitlab_etc="/opt/docker_with_backend/gitlab/etc"
gitlab_data="/opt/docker_with_backend/gitlab/data"
gitlab_log="/opt/docker_with_backend/gitlab/log"

gitlab_port_map="-p 8089:80"
gitlab_config_map="-v $gitlab_etc:/etc/gitlab -v $gitlab_data:/var/opt/gitlab -v $gitlab_log:/var/log/gitlab"

# 安装gitlab
echo $docker_run gitlab $gitlab_config_map $gitlab_port_map $use_network_alias gitlab docker.io/beginor/gitlab-ce:11.0.1-ce.0
#$docker_run nginx $code_dir_map $nginx_config_map $nginx_port_map $use_network_alias nginx nginx:latest
