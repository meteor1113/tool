
#!/bin/sh

set -e

# 设置不使用证书认证的docker registry

echo "execute manually using root user(ubuntu/systemd):"
echo "  1. modify [/etc/systemd/system/docker.service.d/10-machine.conf]: append [--insecure-registry=10.48.211.252](use registry ip instead) to [ExecStart=xxx]"
echo "  2. reload systemd: [systemctl daemon-reload]"
echo "  3. restart dockerd: [service docker restart]"
