#!/usr/bin/env python
#coding=utf-8

##
# Copyright (c) 2008 Meteor Liu <meteor1113@gmail.com>.
# All rights reserved.
#
# @file
# @author Meteor Liu
# @date 2008-10-27

"""tab2space module"""


# import standard library module
import sys
import os
import re

# import other library module

# import customer module


def tab2space_file(path, spacecount = 4):
    f = open(path, "rb")
    s = f.read().replace("\t", ' ' * spacecount)
    f.close()
    f = open(path, "wb")
    f.write(s)
    f.close()


def tab2space(path, regex = "", spacecount = 4):
    if os.path.isfile(path):
        return tab2space_file(path, spacecount)
    elif os.path.isdir(path):
        all = os.walk(path)
        while True:
            try:
                adir = all.next()
            except:
                break
            for afile in adir[2]:
                if re.match(regex, afile):
                    name = os.path.join(adir[0], afile)
                    print name
                    tab2space_file(name, spacecount)
        return


def main():
    if len(sys.argv) <= 1:
        print "Usage %s directory regex spacecount" % sys.argv[0]
        return
    r = sys.argv[2] if len(sys.argv) >= 3 else ""
    if len(sys.argv) >= 4 and sys.argv[3].isdigit():
        spacecount = int(sys.argv[3])
    else:
        spacecount = 4
    tab2space(sys.argv[1], r, spacecount)


def test():
    pass


if __name__ == "__main__":
    main()

