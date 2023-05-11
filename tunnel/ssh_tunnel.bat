@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM

:: setting
set HOST=azvm1
:: set KEY_FILE="id_rsa"

:LOOP

echo [%HOST%] [%date% %time%] ssh running...
ssh %HOST% -NR 0.0.0.0:10022:127.0.0.1:22 -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"
@REM "C:\Program Files\Git\usr\bin\ssh.exe" %HOST% -fNR 0.0.0.0:10022:127.0.0.1:22 -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"

timeout 5
goto LOOP

echo [%HOST%] [%date% %time%] exited
