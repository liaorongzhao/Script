#!/bin/bash
X=/usr/local/nginx/sbin/nginx
case  $1 in
start)
    $X;;
stop)
    $X  -s  stop;;
restart)
    $X  -s stop
    $X;;
status)
    netstat  -nutlp  |  grep  nginx
   [ $? -eq  0  ]  &&  echo  "服务已启动"||echo "服务未启动";;
*)
    echo  "error"
esac

