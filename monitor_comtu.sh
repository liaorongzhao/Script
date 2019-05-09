#!/bin/bash
cpu=$(uptime | awk  '{print $10}')
echo "本机最近五分钟的CPU负载是:$cpu"
ip=`ifconfig eth0  | awk '/netmask/{print $2}'`
echo  "本机IP是:$ip"
net_in=`ifconfig eth0  | awk '/RX p/{print $5}'`
echo  "本机入站流量是:$net_in"
net_out=`ifconfig eth0  | awk '/TX p/{print $5}'`
echo  "本机出站流量是:$net_out"
mem=`free  | awk  '/Mem/{print $3}'`
echo  "本机剩余内存大小:$mem"
disk=`df  |  awk  '/\/$/{print $4}'`
echo  "根分区剩余容量为:$disk"
user=`cat /etc/passwd  |  wc -l`
echo  "本地账户数量为:$user"
login=`who | wc -l`
echo  "当前登录账户数量为:$login"
process=`ps -aux  | wc -l`
echo  "当前计算机启动的进程数为:$process"
soft=`rpm -qa | wc -l`
echo  "当前计算机安装的软件数量:$soft"
