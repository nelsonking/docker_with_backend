#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container gitlaben

# 代码共享配置 (需要变更为真实环境)
code_dir="/data/www"
code_dir_map="-v $code_dir:/web"

# gitlab 公共配置
gitlab_config="/opt/docker_with_backend/gitlaben/etc"
gitlab_log="/opt/docker_with_backend/gitlaben/log"
gitlab_data="/opt/docker_with_backend/gitlaben/data"

gitlab_config_map="-v $gitlab_config:/etc/gitlab"
gitlab_log_map="-v $gitlab_log:/var/log/gitlab"
gitlab_data_map="-v $gitlab_data:/var/opt/gitlab"
gitlab_port_map="-p 9090:80"

#$docker_run gitlab $gitlab_config_map $gitlab_log_map $gitlab_data_map $gitlab_port_map $use_network_alias gitlab docker.io/gitlab/gitlab-ce:latest
$docker_run gitlaben $add_host $code_dir_map $gitlab_config_map $gitlab_log_map $gitlab_data_map $gitlab_port_map $use_network_alias gitlaben docker.io/gitlab/gitlab-ce:latest
docker exec -it gitlaben update-permissions
docker restart gitlaben
#$docker_run gitlab $gitlab_port_map $use_network_alias gitlab docker.io/gitlab/gitlab-ce:latest
