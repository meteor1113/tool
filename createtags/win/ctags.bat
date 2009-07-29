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
set PATH=%~d0%~p0;c:\program files\vim\vim72;%PATH%

ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q
ctags.exe -a --c++-kinds=+p --fields=+iaS --extra=+q -R c:/mingw/include

set PATH=%temppath%
