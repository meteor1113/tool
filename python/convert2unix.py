#!/usr/bin/env python
#coding=utf-8

##
# Copyright (c) 2008 Meteor Liu <meteor1113@gmail.com>.
# All rights reserved.
#
# @file
# @author Meteor Liu
# @date 2008-10-27

"""convert2unix module"""


# import standard library module
import sys
import os
import re

# import other library module

# import customer module


def convertfile(path):
    f = open(path, "rb")
    s = re.sub("\r\n|\r|\n", "\n", f.read())
    f.close()
    f = open(path, "wb")
    f.write(s)
    f.close()


def convert2unix(path, regex = ""):
    if os.path.isfile(path):
        return convertfile(path)
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
                    convertfile(name)
        return


def main():
    if len(sys.argv) <= 1:
        print "Usage %s directory regex" % sys.argv[0]
        return
    r = sys.argv[2] if len(sys.argv) >= 3 else ""
    convert2unix(sys.argv[1], r)


def test():
    pass


if __name__ == "__main__":
    main()
