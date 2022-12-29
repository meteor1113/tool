@echo off

:: setting
set HOST="liuxin@azvm1.liuxin.tech"
:: set KEY_FILE="id_rsa"
set MONITOR_PORT=4010
set REMOTE_PORT=10022
set LOCAL_PORT=22

echo ***

:LOOP

echo [%HOST%] [%date% %time%] Autossh running...
set AUTOSSH_PATH=C:\Windows\System32\OpenSSH\ssh.exe
set AUTOSSH_LOGLEVEL=7
set "AUTOSSH_DEBUG=1"
autossh.exe -M %MONITOR_PORT% %HOST% -R 0.0.0.0:%REMOTE_PORT%:127.0.0.1:%LOCAL_PORT% -N -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"

timeout 60 > NUL
@REM goto LOOP

echo [%HOST%] [%date% %time%] exited
