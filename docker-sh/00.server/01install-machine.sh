
#!/bin/sh

set -e

# 在服务器上安装docker-machine，曾经出现过服务器上curl下载的有问题(执行有莫名其妙的错误)，
# 最好从[https://github.com/docker/machine/releases]手动下载安装

echo "install docker-machine from https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m`"
curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
echo "docker-machine installed."
