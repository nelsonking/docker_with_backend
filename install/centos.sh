#!/bin/bash
source ./common.sh

# ��������Ƿ�װ����ɾ���Ѱ�װ������
check_container centos

# centos linux运行环境
linux_port_map="-p 3000:3000" 

# 安装centos linux 运行环境
$docker_run centos $code_dir_map $linux_port_map $use_network_alias centos centos:latest 
