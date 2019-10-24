#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container redis

# reids 共享配置 (需要变更为真实环境)
redis_data="/opt/docker_with_backend/redis/data"
# 配置修改项 去掉绑定，去掉安全模型，开启持久化
redis_config="/opt/docker_with_backend/redis/redis.conf"

redis_data_map="-v $redis_data:/data"
redis_config_map="-v $redis_config:/etc/redis/redis.conf"
redis_port_map="-p 6379:6379"
# 运行reidis命令，并指定配置文件
redis_server="redis-server /etc/redis/redis.conf"

# 安装redis
echo $docker_run redis $redis_data_map $redis_config_map $redis_port_map $use_network_alias redis redis:3.2 $redis_server
echo "如果你在使用windos 请将上诉命令扔进cmd环境执行"
