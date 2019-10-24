#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container dns

# 配置修改项 去掉绑定，去掉安全模型，开启持久化
dns_config="/opt/docker_with_backend/dns/dnsmasqhosts"

dns_config_map="-v $dns_config:/etc/dnsmasqhosts";
dns_port_map="-p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN"

# 安装dns
echo $docker_run dns $dns_port_map $dns_config_map $use_network_alias dns andyshinn/dnsmasq
