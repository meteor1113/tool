
#!/bin/sh

set -e

# 在服务器上安装docker-compose，曾经出现过服务器上curl下载的有问题(执行有莫名其妙的错误)，
# 最好从[https://github.com/docker/compose/releases]手动下载安装

echo "install docker-compose from https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m`"
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "docker-compose installed."
