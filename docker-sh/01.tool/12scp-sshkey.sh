
#!/bin/sh

set -e

# 或手动把本机的~/.ssh/id_rsa.pub追加到[user@$ip:~/.ssh/authorized_keys]
# 这不是docker-machine的要求，而是为了服务器sshd禁用密码登录后还能ssh登录

if [ $# != 2 ] ; then
  echo "USAGE: $0 username ip"
  echo " e.g.: $0 lab 10.48.211.252"
  exit 1;
fi

username=$1
ip=$2

ssh-copy-id -i ~/.ssh/id_rsa.pub ${username}@${ip}
echo "ssh key copied. exec [ssh ${username}@${ip}] to confirm PubkeyAuthentication"
