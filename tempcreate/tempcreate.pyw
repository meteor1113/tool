#!/usr/bin/env python
# -*- coding: utf-8 -*-
##
# @file
# @author Meteor Liu
# @date 2008-09-16
#
# Copyright (C) 2008 Meteor Liu <meteor1113@gmail.com>
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.

"""this program is create's GUI warpper version"""


# import standard library module

# import other library module

# import customer module
try:
    import wxcreate
    cc = wxcreate
except:
    import tkcreate
    cc = tkcreate


def main():
    cc.App()


if __name__ == "__main__":
    main()
