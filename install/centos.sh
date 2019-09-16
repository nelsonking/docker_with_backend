#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container centos

# centos linux杩愯鐜
linux_port_map="-p 3000:3000" 

# 瀹夎centos linux 杩愯鐜
$docker_run centos $code_dir_map $linux_port_map $use_network_alias centos centos:latest 
