#!/bin/sh

set -e

# 删除tag为<none>的镜像，被容器使用的不会删除

echo 'docker rmi $(docker images -f "dangling=true" -q)'
docker rmi $(docker images -f "dangling=true" -q)
