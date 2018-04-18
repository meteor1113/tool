
#!/bin/sh

set -e

# 为用户[docker]生成ssh-key

username=docker
sshpubfile="/home/$username/.ssh/id_rsa.pub"

if [ -f "$sshpubfile" ]; then
    echo "user[$username]'s ssh-key already exists."
else
    echo "generate ssh-key for user[$username]..."
    su -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q -b 2048" $username
    echo "user[$username]'s ssh-key generated."
fi
