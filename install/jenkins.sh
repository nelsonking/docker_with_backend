#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container jenkins

# 代码共享配置 (需要变更为真实环境)
jenkins_base="/opt/docker_with_backend/jenkins"
jenkins_data="$jenkins_base/data"
jenkins_data_map="-v $jenkins_data:/var/jenkins_home"
jenkins_port_map="-p 8080:8080 -p 50000:50000";

# 更改权限
sudo chown -R 1000:1000 $jenkins_base 

# 安装jenkins
#$docker_run jenkins $jenkins_data_map $jekins_port_map $use_network_alias jekins docker.io/jenkins:latest
$docker_run jenkins $add_host $jenkins_data_map $jenkins_port_map $use_network_alias jenkins docker.io/jenkins:latest

# 07497caa505d492281019533ae49d933 
# root password
