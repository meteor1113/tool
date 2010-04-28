#!/usr/bin/env python
# -*- coding: utf-8 -*-
##
# @file
# @author Meteor Liu <meteor1113@gmail.com>
# @date 2008-12-25
#
# Copyright (C) 2008 Meteor Liu
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.

"""common module"""


# import standard library module
import os

# import other library module

# import customer module


def get_config_path():
    folder = os.path.abspath(os.path.curdir)
    return os.path.join(folder, "tempcreate.ini")


def get_license_dir():
    folder = os.path.abspath(os.path.curdir)
    return os.path.join(folder, "licenses")


def get_licenses():
    licdir = get_license_dir()
    entries = os.listdir(licdir)
    licenses = []
    for entry in entries:
        path = os.path.join(licdir, entry)
        if (os.path.isfile(path) and entry.endswith(".license")):
            licenses.append(entry)
    return licenses


def test():
    """unittest function"""
    pass


if __name__ == "__main__":
    test()
