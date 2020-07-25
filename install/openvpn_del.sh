#!/bin/bash
source ./common.sh

# 代码共享配置 (需要变更为真实环境)
vpn_data="/opt/docker_with_backend/openvpn"
vpn_data_map="-v $vpn_data:/etc/openvpn"
vpn_port_map="-p 1194:1194/udp"

vpn_image="docker.io/kylemanna/openvpn"
vpn_cer_name="qjyedu"
export_dir="/opt/docker_with_backend/export/"
export_cer="/opt/docker_with_backend/export/qjyedu.ovpn"


# 删除用户
read -p "Delete username: " DNAME
docker run $vpn_data_map --rm -it $vpn_image easyrsa revoke $DNAME
docker run $vpn_data_map --rm -it $vpn_image easyrsa gen-crl
docker run $vpn_data_map --rm -it $vpn_image rm -f /etc/openvpn/pki/reqs/"$DNAME".req
docker run $vpn_data_map --rm -it $vpn_image rm -f /etc/openvpn/pki/private/"$DNAME".key
docker run $vpn_data_map --rm -it $vpn_image rm -f /etc/openvpn/pki/issued/"$DNAME".crt
echo docker restart openvpn
