
#!/bin/sh

set -e

# 禁用ssh密码登录:
# 手动把[/etc/ssh/sshd_config]中的[PasswordAuthentication yes]修改为[PasswordAuthentication no]，然后重启sshd服务

echo "execute manually using root user:"
echo "  1. replace [PasswordAuthentication yes] to [PasswordAuthentication no] in /etc/ssh/sshd_config"
echo "  2. restart sshd(may be [service sshd restart] in ubuntu)"
