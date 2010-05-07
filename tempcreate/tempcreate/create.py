#!/usr/bin/env python
#coding=utf-8
##
# @file
# @author Meteor Liu <meteor1113@gmail.com>
# @date 2008-09-16
#
# Copyright (c) 2008 Meteor Liu

"""this program use to create file from template"""


# import standard library module
import sys
import os
import re
import datetime
import getopt

# import other library module

# import customer module
import common


HELP_STRING = """
Usage %s [-c] [-a] [-e] [-l] | [-h]
    -c CLASSNAME, --classname=CLASSNAME
        set class name
    -a AUTHOR, --author=AUTHOR
        set author name
    -e EMAIL, --email=EMAIL
        set email
    -l LICENSE, --license=LICENSE
        set license file name
    -h, --help
        Show this message
"""


def Usage():
    print HELP_STRING % sys.argv[0]


def Replace(content, classname, filethinname, author, email, cr):
    year = str(datetime.date.today().year)
    datenow = datetime.date.today().isoformat()
    dtnow = datetime.datetime.now().isoformat()
    content = content.replace("%copyright%", cr)
    content = content.replace("%year%", year)
    content = content.replace("%filethinname%", filethinname)
    content = content.replace("%ClassName%", classname)
    content = content.replace("%classname%", classname.lower())
    content = content.replace("%CLASSNAME%", classname.upper())
    content = content.replace("%authorname%", author)
    content = content.replace("%date%", datenow)
    content = content.replace("%datetime%", dtnow)
    content = content.replace("%email%", email)
    if sys.platform != "win32": # darwin or unix or linux
        content = re.sub("\r\n|\r|\n", "\n", content)
    content = re.sub("^(\r\n|\r|\n)+", "", content)
    return content


def CreateFile(tempfile, filethinname, fileext, classname, author = "",
               email = "", cr = ""):
    tempf = file(tempfile, "r")
    tempcont = tempf.read()
    tempf.close()
    content = Replace(tempcont, classname, filethinname, author, email, cr)
    if not os.path.exists("result"):
        os.mkdir("result")
    filename = filethinname + fileext;
    resultFile = open("result/" + filename, "w")
    resultFile.write(content)
    resultFile.close()


def ParseCommandArg():
    classname = ""
    author = ""
    email = ""
    lic = ""
    opts, args = getopt.getopt(sys.argv[1:], 'c:a:e:l:h?',
        ["classname=", "author=", "email=", "license=", "help"])
    for o, a in opts:
        if o == '-c' or o == "--classname":
            classname = a
        if o in ("-a", "--author"):
            author = a
        if o in ("-e", "--email"):
            email = a
        if o in ("-l", "--license"):
            lic = a
        if o in ("-h", "-?", "--help"):
            Usage();
            sys.exit()
    if (classname == ""):
        classname = raw_input("input class name:")
    if (author == ""):
        author = raw_input("input author name:")
    if (email == ""):
        email = raw_input("input email:")
    licPath = os.path.join(common.get_license_dir(), lic)
    while ((not os.path.exists(licPath)) or (lic == "")):
        lic = raw_input("input license file name:")
        licPath = os.path.join(common.get_license_dir(), lic)
    cr = open(licPath).read()
    return (classname, author, email, cr)
