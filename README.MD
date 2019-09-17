## 项目说明
1、该项目为docker集成环境的一个快速部署案例，可通过简单的修改配置目录快速搭建一个开发环境。

2、docker 镜像包含 nginx、php、mysql、mongodb、redis、centos所有的镜像都是官方提供的镜像、没有镜像任何修改。

3、其中除了centos 都应应用镜像、为开发用，centos 作为一个单独 linux 环境赠送~

4、项目将所有配置文件同镜像分离，方便开发可以版本控制，多人共享（例如一个 nginx server，一个人配置了，其他人通过git拉下来即可）

5、所有安装项目的文件都在 install 目录下包含所有上文提供的镜像和windows docker安装包

6、所有命令都包含在 bin 目录下 包含 重启服务 重启容器 容器（向内 向外）拷贝

7、安装说明
``` bash
使用含有bash脚本环境执行命令，如MINWG（安装git会自动安装）

镜像下载地址: https://pan.baidu.com/s/1VNa0FWvl-CjMLyzZt_jUpg 
提取码: remq 
```

### 安装步骤
1: 安装 source/Docker for Windows Installer.exe
2: 执行 install/load_images.sh
3：按需修改 install 下的应用配置目录，然后执行即可
