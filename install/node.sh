#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container node

# 代码共享配置 (需要变更为真实环境)
code_dir="D:/Code"
code_dir_map="-v $code_dir:/web"

node_port_map="-p 3000:3000"


# 安装php
$docker_run node $code_dir_map $node_port_map $use_network_alias node node