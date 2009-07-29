#!/bin/sh

##
# Copyright (C) 2008 Meteor Liu
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.
#
# @file
# @author Meteor Liu <meteor1113@gmail.com>
# @date 2008-10-27


cd $(dirname $0)

ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
ctags -a --c++-kinds=+p --fields=+iaS --extra=+q -R /usr/include
ctags -a -R /System/Library/Frameworks/AppKit.framework/Versions/C/Headers
ctags -a -R /System/Library/Frameworks/Foundation.framework/Versions/C/Headers
ctags -a -R /System/Library/Frameworks/CoreData.framework/Versions/A/Headers
