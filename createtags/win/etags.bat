@rem
@rem Copyright (C) 2008 Meteor Liu
@rem
@rem This code has been released into the Public Domain.
@rem You may do whatever you like with it.
@rem
@rem @file
@rem @author Meteor Liu <meteor1113@gmail.com>
@rem @date 2008-10-27


set temppath=%PATH%
set PATH=%~d0%~p0;c:\emacs\bin;c:\emacs-23.3\bin;c:\emacs-23.2\bin;c:\emacs-23.1\bin;c:\emacs-22.3\bin;C:\msys\1.0\bin;C:\MinGW\bin;%PATH%

find.exe . -type f -name "*.[hHcC]" > cscope.files
find.exe . -type f -name "*.[hHcC][pPxX+][pPxX+]" -o -name "*.[hH][hH]" -o -name "*.[cC][cCpP]" >> cscope.files
find.exe . -type f -name "*.[mM]" -o -name "*.[mM][mM]" >> cscope.files
find.exe . -type f -name "*.[pP][yY]" >> cscope.files
find.exe . -type f -name "*.[jJ][aA][vV][aA]" >> cscope.files
find.exe . -type f -name "*.[eE][lL]" >> cscope.files
find.exe c:/mingw/include -type f -name "*" >> cscope.files
type cscope.files | etags.exe -

set PATH=%temppath%
