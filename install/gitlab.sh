#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container gitlab

# gitlab 公共配置
gitlab_config="/opt/docker_with_backend/gitlab/etc"
gitlab_log="/opt/docker_with_backend/gitlab/log"
gitlab_data="/opt/docker_with_backend/gitlab/data"

gitlab_config_map="-v $gitlab_config:/etc/gitlab"
gitlab_log_map="-v $gitlab_log:/var/log/gitlab"
gitlab_data_map="-v $gitlab_data:/var/opt/gitlab"
gitlab_port_map="-p 8090:80"

#$docker_run gitlab $gitlab_config_map $gitlab_log_map $gitlab_data_map $gitlab_port_map $use_network_alias gitlab docker.io/gitlab/gitlab-ce:latest
echo $docker_run gitlab $gitlab_config_map $gitlab_log_map $gitlab_data_map $gitlab_port_map $use_network_alias gitlab docker.io/beginor/gitlab-ce:11.0.1-ce.0
#$docker_run gitlab $gitlab_port_map $use_network_alias gitlab docker.io/gitlab/gitlab-ce:latest
