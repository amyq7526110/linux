#!/bin/bash
case $1 in 
list)
  virsh list --all ;;
start)
  virsh start $2 ;;
stop)
  virsh destroy $2 ;;
enable)
  virsh  autostart $2 ;;
disable) 
  virsh  autostart --disable  $2 ;;
*)
  echo "Usage:$0 list" 
  echo "Usage:$0 [start|stop|enable|disable]  VM_name" 
 cat << EOF
list  显示虚拟机列表
start 启动虚拟机
stop  关闭虚拟机
enable 设置虚拟机为开机自起
disable 关闭虚拟机开机自起
EOF
;;
esac
