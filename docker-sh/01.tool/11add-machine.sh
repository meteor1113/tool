#!/bin/sh

set -e

# 使用driver none在本地创建docker machine，相当于在本地加个alias

if [ $# != 2 ] ; then
  echo "USAGE: $0 ip machinename"
  echo " e.g.: $0 10.48.211.252 YJPD-DEVSRV-LabDevDocker"
  exit 1;
fi

ip=$1
machinename=$2
username=docker

echo docker-machine create --driver none -url=tcp://${ip}:2376 ${machinename}
docker-machine create --driver none -url=tcp://${ip}:2376 ${machinename}

# 拷贝远程的证书文件
scp ${username}@${ip}:~/.docker/machine/machines/${machinename}/\*.pem ~/.docker/machine/machines/${machinename}
# 修改本地config.json
# cp ~/.docker/machine/machines/${machinename}/config.json ~/.docker/machine/machines/${machinename}/config.json.orig
case `uname -o` in
  Msys)
    echo sed -i.orig "s#.docker\\\\\\\\machine\\\\\\\\certs#.docker\\\\\\\\machine\\\\\\\\machines\\\\\\\\${machinename}#" ~/.docker/machine/machines/${machinename}/config.json
    sed -i.orig "s#.docker\\\\\\\\machine\\\\\\\\certs#.docker\\\\\\\\machine\\\\\\\\machines\\\\\\\\${machinename}#" ~/.docker/machine/machines/${machinename}/config.json
    # sed "s#.docker\\\\\\\\machine\\\\\\\\certs#.docker\\\\\\\\machine\\\\\\\\machines\\\\\\\\${machinename}#g" ~/.docker/machine/machines/${machinename}/config.json
    ;;
  *)
    echo sed -i.orig "s#.docker/machine/certs#.docker/machine/machines/${machinename}#" ~/.docker/machine/machines/${machinename}/config.json
    sed -i.orig "s#.docker/machine/certs#.docker/machine/machines/${machinename}#" ~/.docker/machine/machines/${machinename}/config.json
    # sed "s#.docker/machine/certs#.docker/machine/machines/${machinename}#g" ~/.docker/machine/machines/${machinename}/config.json
    ;;
esac

docker-machine ls
echo "docker machine[${machinename}] added."
