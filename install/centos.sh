#!/bin/bash
source ./common.sh

# ��������Ƿ�װ����ɾ���Ѱ�װ������
check_container centos

# ���빲������ (��Ҫ���Ϊ��ʵ����)
code_dir="D:/Code"
code_dir_map="-v $code_dir:/web"

# centos linux�˿����â�
linux_port_map="-p 3000:3000" 

# ����centos�境
$docker_run centos $code_dir_map $linux_port_map $use_network_alias centos centos:latest 
