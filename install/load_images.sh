#!/bin/sh

docker load -i ../source/centos_latest.tar.gz
docker load -i ../source/mongo_latest.tar.gz
docker load -i ../source/mysql_5.7.tar.gz
docker load -i ../source/nginx_latest.tar.gz
docker load -i ../source/php_7.1_fpm.tar.gz
docker load -i ../source/redis_3.2.tar.gz

