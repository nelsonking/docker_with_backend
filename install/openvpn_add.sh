#!/bin/bash
source ./common.sh

# 代码共享配置 (需要变更为真实环境)
vpn_data="/opt/docker_with_backend/openvpn"
vpn_data_map="-v $vpn_data:/etc/openvpn"
vpn_port_map="-p 1194:1194/udp"

vpn_image="docker.io/kylemanna/openvpn"
vpn_cer_name="qjyedu"
export_dir="/opt/docker_with_backend/export/"


# 添加用户
read -p "please your username: " NAME
echo 添加用户
docker run $vpn_data_map --rm -it $vpn_image easyrsa build-client-full $NAME nopass
docker run $vpn_data_map --rm $vpn_image ovpn_getclient $NAME > $export_dir${NAME}.ovpn
echo docker restart openvpn
