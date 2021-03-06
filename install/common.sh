#!/bin/bash
# docker 运行配置
network="sharenetwork"
docker_run="docker run -d -it --privileged --name"

# 使用桥接网络，并对当前容器网络命名
use_network_alias="--network $network --network-alias"

# 添加hosts
add_host="--add-host gitlab.devops.top:192.168.10.234"

# 创建共享网络
networkexist=`docker network ls | grep $network`
if [ -n "$networkexist" ]; then
    echo "network $network has been created"
else
    docker network create $network
    echo "network $network create success"
fi    

# 共享root用户家目录作为交换目录
share_map="-v /root:/share"

# 超级管理
supper="--privileged=true"
super_append="/usr/sbin/init"

# 共享时间
share_time="-v /etc/localtime:/etc/localtime"

# 检查容器是否创建
check_container(){
    container_exist=`docker ps -a | grep $1`
    if [ -n "$container_exist" ];then
        echo "container $1 has been created it will be create after delete the old container $1"
        container_started=`docker ps | grep $1`
        if [ -n "$container_started" ];then
            docker stop $1
        fi
        
        docker rm $1
    else
        echo "container $1 will be create"
    fi    
}
