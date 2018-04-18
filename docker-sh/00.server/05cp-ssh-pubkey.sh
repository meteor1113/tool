
#!/bin/sh

set -e

# 拷贝用户[docker]的ssh公钥到[/root/.ssh/authorized_keys]并设置合适的权限，使用户[docker]可以免密码ssh登录root

username=docker
sshpubfile="/home/$username/.ssh/id_rsa.pub"

if [ -f "$sshpubfile" ]; then
    cat $sshpubfile >> ~/.ssh/authorized_keys; \
    chmod 600 ~/.ssh/authorized_keys; \
    echo "user[$username]'s ssh-pubkey copied."
else
    echo "error: file[$sshpubfile] doesn't exist."
fi
