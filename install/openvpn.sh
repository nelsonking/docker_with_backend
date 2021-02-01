#!/bin/bash
source ./common.sh

# 检查容器是否安装，并删除已安装的容器
check_container openvpn

# 代码共享配置 (需要变更为真实环境)
vpn_data="/opt/docker_with_backend/openvpn"
vpn_data_map="-v $vpn_data:/etc/openvpn"
vpn_port_map="-p 1194:1194/udp"

vpn_image="docker.io/kylemanna/openvpn"
vpn_cer_name="qjyedu"
export_cer="/opt/docker_with_backend/export/qjyedu.ovpn"

# 安装openvpn
echo 生成秘钥
echo docker run $vpn_data_map --rm $vpn_image ovpn_genconfig -u udp://221.217.90.206

echo 生成配置文件
echo docker run $vpn_data_map --rm -it $vpn_image ovpn_initpki

echo 生成客户端证书
echo docker run $vpn_data_map --rm -it $vpn_image easyrsa build-client-full $vpn_cer_name nopass

echo 导出客户端配置
echo "docker run $vpn_data_map --rm $vpn_image ovpn_getclient $vpn_cer_name > $export_cer"

echo 运行服务
echo $docker_run openvpn $vpn_data_map $vpn_port_map --cap-add=NET_ADMIN $vpn_image 
