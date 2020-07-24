#!/bin/bash
source ./common.sh

# ��������Ƿ�װ����ɾ���Ѱ�װ������
check_container centos

# ���빲������ (��Ҫ���Ϊ��ʵ����)
code_dir="/data/www"
code_dir_map="-v $code_dir:/web"

# centos linux�˿����â�
linux_port_map="-p 9001:9001" 

# ����centos�境
$docker_run centos $super $code_dir_map $linux_port_map $use_network_alias centos centos:php $super_append
