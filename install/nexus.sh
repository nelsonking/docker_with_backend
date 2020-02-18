#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container nexus 

# nexus 公共配置
nexus_data="/opt/docker_with_backend/nexus-data"
nexus_data_map="-v $nexus_data:/nexus-data"
nexus_port_map="-p 8081:8081 -p 8082:8082 -p 8083:8083 -p 8084:8084"

mkdir -p $nexus_data
chown -R 200 $nexus_data

$docker_run nexus $add_host $nexus_data_map $nexus_port_map sonatype/nexus3 
# echo docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 8084:8084 -v /opt/nexus-data:/nexus-data --name nexus3 sonatype/nexus3 

# 官网地址 https://hub.docker.com/r/sonatype/nexus3/
# 端口
# 8081：nexus3网页端 admin/admin123
# 8082：docker(hosted)私有仓库，可以pull和push
# 8083：docker(proxy)代理远程仓库，只能pull
# 8084：docker(group)私有仓库和代理的组，只能pull
# 链接：https://www.jianshu.com/p/ba054bc4f76a
