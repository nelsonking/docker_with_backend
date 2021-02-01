#!/bin/bash
https://www.lylinux.net/article/2018/9/18/51.html

docker build -t ngrok .

# after
docker run -it  -p 8081:8081 -p 4443:4443 -v /root/docker/ngrok/bin:/root/ngrok/bin/ -d ngrok /ngrok/bin/ngrokd -domain="home.nelsonking.cn" -httpAddr=":8081"

# after 
docker inspect
# mount volumns 目录下 bin

# 对应客户端执行
./ngrok  -config=config.yml start-all

