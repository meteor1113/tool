#!/usr/bin/env python
# -*- coding: utf-8 -*-

##
# @file
# @author Meteor Liu
# @date 2009-02-13
#
# Copyright (C) 2008 Meteor Liu <meteor1113@gmail.com>
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.

"""this program use to create a ObjectiveC class,
include h and m file.
"""


# import standard library module

# import other library module

# import customer module
import create


JAVA_FILE_TEMPLATE = "templates/java-java.template"


def CreateFile(classname, author = "", email = "", cr = "", lowercase = False):
    cr = "/**\n" + cr
    cr = cr.replace("\n", "\n * ")
    cr = cr + "\n */"
    cr = cr.replace(" * \n", " *\n")

    thinname = classname
    if (lowercase):
        thinname = thinname.lower()
    create.CreateFile(JAVA_FILE_TEMPLATE, thinname + ".java",
                      classname, author, email, cr)


if __name__ == '__main__':
    classname, author, email, cr = create.ParseCommandArg()
    CreateFile(classname, author, email, cr);
