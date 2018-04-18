#!/bin/sh

set -e

# 删除docker machine

if [ $# != 1 ] ; then
  echo "USAGE: $0 machinename"
  echo " e.g.: $0 YJPD-DEVSRV-LabDevDocker"
  exit 1;
fi

username=docker
machinename=$1

echo docker-machine rm -y ${machinename}
su -c "docker-machine rm -y ${machinename}" $username
su -c "docker-machine ls" $username
echo "docker machine[${machinename}] removed."
