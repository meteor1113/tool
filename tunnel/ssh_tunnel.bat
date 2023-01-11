@echo off

:: setting
set HOST=azvm1
:: set KEY_FILE="id_rsa"

@REM :LOOP

echo [%HOST%] [%date% %time%] ssh running...
"C:\Program Files\Git\usr\bin\ssh.exe" %HOST% -fNR 0.0.0.0:10022:127.0.0.1:22 -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"

@REM timeout 60 > NUL
@REM goto LOOP

@REM echo [%HOST%] [%date% %time%] exited
