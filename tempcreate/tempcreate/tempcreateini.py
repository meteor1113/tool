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

"""tempcreateini module"""


# import standard library module
import ConfigParser

# import other library module

# import customer module


class TempCreateIni(object):
    """TempCreateIni class"""

    def __init__(self, filePath = ""):
        """constructor"""
        self.config = ConfigParser.ConfigParser()
        if (filePath):
            self.read(filePath)

    def read(self, filePath):
        self.config.read(filePath)

    def write(self, filePath):
        self.config.write(open(filePath, "w"))

    def get_last_type(self):
        self._confirm_options()
        return self.config.get("type", "last")

    def get_last_lowercase(self):
        self._confirm_options()
        return self.config.get("lowercase", "last")

    def get_last_classname(self):
        self._confirm_options()
        return self.config.get("classname", "last")
        
    def get_authors(self):
        """return a list contain all authors"""
        self._confirm_options()
        return eval(self.config.get("author", "all"))

    def get_last_author(self):
        """return a string contain last used author"""
        self._confirm_options()
        return self.config.get("author", "last")

    def get_emails(self):
        """return a list contain all emails"""
        self._confirm_options()
        return eval(self.config.get("email", "all"))

    def get_last_email(self):
        """return a string contain last used email"""
        self._confirm_options()
        return self.config.get("email", "last")

    def get_last_license(self):
        """return a string contain last used license file name"""
        self._confirm_options()
        return self.config.get("license", "last")

    def set_last_type(self, ty):
        self._confirm_sections()
        self.config.set("type", "last", ty)

    def set_last_lowercase(self, value):
        self._confirm_sections()
        self.config.set("lowercase", "last", value)

    def set_last_classname(self, ty):
        self._confirm_sections()
        self.config.set("classname", "last", ty)
        
    def set_authors(self, authors):
        self._confirm_sections()
        self.config.set("author", "all", repr(authors))

    def set_last_author(self, author):
        self._confirm_sections()
        self.config.set("author", "last", author)

    def set_emails(self, emails):
        self._confirm_sections()
        self.config.set("email", "all", repr(emails))

    def set_last_email(self, email):
        self._confirm_sections()
        self.config.set("email", "last", email)

    def set_last_license(self, fileName):
        self._confirm_sections()
        self.config.set("license", "last", fileName)

    def _confirm_section(self, section):
        if (not self.config.has_section(section)):
            self.config.add_section(section)
        
    def _confirm_sections(self):
        self._confirm_section("type")
        self._confirm_section("lowercase")
        self._confirm_section("classname")
        self._confirm_section("author")
        self._confirm_section("email")
        self._confirm_section("license")

    def _confirm_string_options(self, section, option, default = ""):
        if (not self.config.has_option(section, option)):
            self.config.set(section, option, default)

    def _confirm_list_options(self, section, option):
        if (not self.config.has_option(section, option)):
            self.config.set(section, option, repr([]))
        
    def _confirm_options(self):
        self._confirm_sections()
        self._confirm_string_options("type", "last")
        self._confirm_string_options("lowercase", "last")
        self._confirm_string_options("classname", "last")
        self._confirm_list_options("author", "all")
        self._confirm_string_options("author", "last")
        self._confirm_list_options("email", "all")
        self._confirm_string_options("email", "last")
        self._confirm_string_options("license", "last")


def test():
    """unittest function"""
    pass


if __name__ == "__main__":
    test()
