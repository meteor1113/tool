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


#find . -type f -name "*.[hHcC]" > cscope.files
#find . -type f -name "*.[hHcC][pPxX+][pPxX+]" -o -name "*.[hH][hH]" -o -name "*.[cC][cCpP]" >> cscope.files
#find . -type f -name "*.[mM]" -o -name "*.[mM][mM]" >> cscope.files
#find . -type f -name "*.[pP][yY]" >> cscope.files
#find . -type f -name "*.[jJ][aA][vV][aA]" >> cscope.files
#find . -type f -name "*.[eE][lL]" >> cscope.files
#find /usr/include -type f -name "*" >> cscope.files
cscope -Rb
