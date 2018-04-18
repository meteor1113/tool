
#!/bin/sh

set -e

# 创建普通用户，加入docker组并设置管理员权限(允许sudo)

if [ $# != 1 ] ; then
  echo "USAGE: $0 username"
  echo " e.g.: $0 lab"
  exit 1;
fi

username=$1

if id -u $username >/dev/null 2>&1; then
    echo "user[$username] already exists."
else
    echo "add user[$username]..."
    adduser $username
    usermod -a -G docker $username
    usermod -a -G sudo $username
    echo "user[$username] added."
fi
