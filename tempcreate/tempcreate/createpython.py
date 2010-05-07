#!/usr/bin/env python
#coding=utf-8

##
# @file
# @author Meteor Liu
# @date 2008-09-16
#
# Copyright (C) 2008 Meteor Liu <meteor1113@gmail.com>
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.

"""this program use to create a python module."""


# import standard library module
import re

# import other library module

# import customer module
import create


PY_FILE_TEMPLATE = "templates/python-py.template"


def CreateFile(classname, author = "", email = "", cr = "", lowercase = True):
    cr = "##\n" + cr
    cr = cr.replace("\n", "\n# ")
    cr = re.sub("\r\n|\r|\n", "\n", cr)
    cr = cr.replace("# \n", "#\n")

    thinname = classname
    if (lowercase):
        thinname = thinname.lower()
    create.CreateFile(PY_FILE_TEMPLATE, thinname, ".py",
        classname, author, email, cr)


if __name__ == '__main__':
    classname, author, email, cr = create.ParseCommandArg()
    CreateFile(classname, author, email, cr);
