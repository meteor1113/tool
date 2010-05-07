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

"""this program use to create a ObjectiveC class,
include h and m file.
"""


# import standard library module
import re

# import other library module

# import customer module
import create


H_FILE_TEMPLATE = "templates/objectivec-h.template"
M_FILE_TEMPLATE = "templates/objectivec-m.template"


def CreateFile(classname, author = "", email = "", cr = "", lowercase = True):
    cr = "/**\n" + cr
    cr = cr.replace("\n", "\n * ")
    cr = cr + "\n */"
    cr = re.sub("\r\n|\r|\n", "\n", cr)
    cr = cr.replace(" * \n", " *\n")

    thinname = classname
    if (lowercase):
        thinname = thinname.lower()
    create.CreateFile(H_FILE_TEMPLATE, thinname, ".h",
                      classname, author, email, cr)
    create.CreateFile(M_FILE_TEMPLATE, thinname, ".m",
                      classname, author, email, cr)


if __name__ == '__main__':
    classname, author, email, cr = create.ParseCommandArg()
    CreateFile(classname, author, email, cr);
