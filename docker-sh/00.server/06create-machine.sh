#!/bin/sh

set -e

# 创建docker machine
# 执行前，需要在aliyun里把服务器的2376端口打开

if [ $# != 2 ] ; then
  echo "USAGE: $0 ip machinename"
  echo " e.g.: $0 10.48.211.252 YJPD-DEVSRV-LabDevDocker"
  exit 1;
fi

# ALI_MIRROR=https://47c3kt1w.mirror.aliyuncs.com #从dev.aliyun.com后台获取你的专属加速器
DOCKER_MIRROR=http://3f5dc137.m.daocloud.io #从https://www.daocloud.io/mirror获取加速器
username=docker

ip=$1
machinename=$2

echo "docker-machine create --engine-registry-mirror=${DOCKER_MIRROR} --driver generic --generic-ip-address=${ip} --generic-ssh-user=root ${machinename}"
su -c "docker-machine create --engine-registry-mirror=${DOCKER_MIRROR} --driver generic --generic-ip-address=${ip} --generic-ssh-user=root ${machinename}" $username
echo "docker machine[${machinename}] created."
