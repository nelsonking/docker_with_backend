#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container jenkins

# 代码共享配置 (需要变更为真实环境)
jekins_data="/opt/docker_with_backend/jekins/data"
jekins_data_map="-v $jekins_data:/var/jekins_home"
jekins_port_map="-p 8080:8080 -p 50000:50000";

# 安装jenkins
#docker run -p 8080:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home jenkinsci/blueocean
echo $docker_run jekins $jekins_data_map $jekins_port_map $use_network_alias jekins docker.io/jenkins:latest
