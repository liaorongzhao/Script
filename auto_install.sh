#!/bin/bash 
Y=$(yum repolist |  awk  '/repolist/{print $2}' | sed 's/,//g')
[ $Y -eq  0 ] &&  echo  "yum源不可用" &&  exit
yum -y install gcc openssl-devel pcre-devel
tar -xf  nginx-1.12.2.tar.gz
cd nginx-1.12.2/
./configure    >   /dev/null
make && make install  >  /dev/null
echo "正在安装......"
/usr/local/nginx/sbin/nginx
S=$(netstat   -utnlp  |  grep  nginx   |  awk  '{print $7}'  | awk -F [/:] '{print $2}')
[ $S == nginx ]  &&  echo "nginx服务启动成功" || echo  "nginx服务未启动成功"

