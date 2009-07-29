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
set PATH=%~d0%~p0;c:\emacs\bin;%PATH%

htags.exe -g -F

set PATH=%temppath%
