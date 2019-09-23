#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container mongo 

# mongo 共享配置 (需要变更为真实环境,mongo 目前无法将 存储文件提取出来，因为共享文件夹的机制与MongoDB使用的内存映射文件不兼容)
mongo_config="D:/docker_with_backend/mongo/mongod.conf"

mongo_config_map="-v $mongo_config:/etc/mongod.conf"
redis_port_map="-p 27017:27017"


# 安装mongo
$docker_run mongo $mongo_config_map $mongo_port_map $use_network_alias mongo mongo:latest
