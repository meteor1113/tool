Dim objShell
Set objShell = WScript.CreateObject ("WScript.shell")
objShell.Run "D:\project\00.common\tool\autossh\autossh_autossh_ssh_tunnel.bat /start",0
Set objShell=Nothing
