#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container centos

# 代码共享配置 (需要变更为真实环境)
code_dir="/data/www"
code_dir_map="-v $code_dir:/web"

# centos linux端口配置
linux_port_map="-p 9001:9001" 

# 运行centos
$docker_run centos $super $code_dir_map $linux_port_map $use_network_alias centos centos:php $super_append
