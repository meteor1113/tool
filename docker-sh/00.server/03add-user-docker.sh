
#!/bin/sh

set -e

# 创建用户[docker]

username=docker

if id -u $username >/dev/null 2>&1; then
    echo "user[$username] already exists."
else
    echo "add user[$username]..."
    adduser $username
    echo "user[$username] added."
fi
