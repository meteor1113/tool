sc create svnserve binpath= "C:\Program Files\Subversion\bin\svnserve.exe --service -r d:\svnrepo" displayname= "Subversion" depend= Tcpip start= auto
sc start svnserve