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

"""this program is create's wxPython warpper version"""


# import standard library module
import os

# import other library module
import wx

# import customer module
import createcpp
import createc
import createpython
import createobjc
import createjava
import tempcreateini
import common

class MyFrame(wx.Frame):
    """MyFrame class"""

    def __init__(self):
        self.iniPath = common.get_config_path()
        self.ini = tempcreateini.TempCreateIni(self.iniPath)
        self.create_ui()
        self.set_default_value()

    def create_ui(self):
        s = wx.DEFAULT_FRAME_STYLE & ~wx.MAXIMIZE_BOX
        wx.Frame.__init__(self, None, -1, "Create Class",
                          size = (500, 450), style = s)
        self.panel = wx.Panel(self, -1)

        h = 10
        self.typeList = ["C++", "C", "Python", "Java", "ObjectiveC"]
        self.typeRb = wx.RadioBox(self.panel, -1, "Select Type",
                                  (35, h), wx.DefaultSize,
                                  self.typeList, 5, wx.RA_SPECIFY_COLS)
        self.Bind(wx.EVT_RADIOBOX, self.on_select_type, self.typeRb)

        h += 60
        text = "lowercase filename?"
        self.lowercaseCb = wx.CheckBox(self.panel, -1, text, pos = (35, h))

        h += 30
        wx.StaticText(self.panel, -1, "ClassName:", pos = (10, h))
        self.classNameCtrl = wx.TextCtrl(self.panel, -1, "",
                                         pos = (80, h), size = (400, 20))

        h += 30
        wx.StaticText(self.panel, -1, "Author:", pos = (10, h))
        self.authorCtrl = wx.ComboBox(self.panel, -1, "", 
                                      pos = (80, h), size = (400, 20))

        h += 30
        wx.StaticText(self.panel, -1, "Email:", pos = (10, h))
        self.emailCtrl = wx.ComboBox(self.panel, -1, "", 
                                      pos = (80, h), size = (400, 20))

        h += 30
        wx.StaticText(self.panel, -1, "Copyright:", pos = (10, h))
        self.licCtrl = wx.Choice(self.panel, -1, pos = (80, h),
                                 size = (400, 20))
        h += 30
        crStyle = wx.TE_MULTILINE | wx.TE_DONTWRAP | wx.TE_AUTO_SCROLL
        self.copyrightCtrl = wx.TextCtrl(self.panel, -1, "", pos = (80, h),
                                         size = (400, 160),
                                         style = crStyle)
        self.Bind(wx.EVT_CHOICE, self.on_select_license, self.licCtrl)

        h += 170
        self.createBtn = wx.Button(self.panel, label="Create", 
                                pos=(200, h), size=(100, 30))
        self.Bind(wx.EVT_BUTTON, self.on_create, self.createBtn)

    def set_default_value(self):
        lastType = self.ini.get_last_type()
        if lastType in self.typeList:
            typeIndex = self.typeList.index(lastType)
            self.typeRb.SetSelection(typeIndex)
        self.on_select_type(None)

        if (len(self.ini.get_last_lowercase()) > 0):
            lowercase = (self.ini.get_last_lowercase().lower() == "true")
            self.lowercaseCb.SetValue(lowercase);

        self.classNameCtrl.SetValue(self.ini.get_last_classname())

        self.authorCtrl.Clear()
        for author in self.ini.get_authors():
            self.authorCtrl.Append(author)
        self.authorCtrl.SetValue(self.ini.get_last_author())

        self.emailCtrl.Clear()
        for email in self.ini.get_emails():
            self.emailCtrl.Append(email)
        self.emailCtrl.SetValue(self.ini.get_last_email())

        self.licCtrl.Clear()
        for lic in common.get_licenses():
            self.licCtrl.Append(lic)
        licIndex = self.licCtrl.FindString(self.ini.get_last_license())
        self.licCtrl.Select(licIndex)
        self.select_license(self.ini.get_last_license())

    def select_license(self, lic):
        licPath = os.path.join(common.get_license_dir(), lic)
        if (os.path.isfile(licPath) and os.path.exists(licPath)):
            self.copyrightCtrl.SetValue(open(licPath).read())

    def on_select_type(self, event):
        sel = self.typeRb.GetSelection()
        if (sel == 3 or sel == 4):
            self.lowercaseCb.SetValue(False)
        else:
            self.lowercaseCb.SetValue(True)

    def on_select_license(self, event):
        self.select_license(self.licCtrl.GetStringSelection())

    def on_create(self, event):
        classname = self.classNameCtrl.GetValue()
        if classname == "" or classname == None:
            wx.MessageBox("classname can't be empty!")
            return
        author = self.authorCtrl.GetValue()
        email = self.emailCtrl.GetValue()
        cr = self.copyrightCtrl.GetValue()
        sel = self.typeRb.GetSelection()
        lowercase = self.lowercaseCb.GetValue()
        if (sel == 0):
            createcpp.CreateFile(classname, author, email, cr, lowercase)
        elif (sel == 1):
            createc.CreateFile(classname, author, email, cr, lowercase)
        elif (sel == 2):
            createpython.CreateFile(classname, author, email, cr, lowercase)
        elif (sel == 3):
            createjava.CreateFile(classname, author, email, cr, lowercase)
        elif (sel == 4):
            createobjc.CreateFile(classname, author, email, cr, lowercase)
        self.save_ini()
        self.set_default_value()

    def save_ini(self):
        ty = self.typeRb.GetString(self.typeRb.GetSelection())
        self.ini.set_last_type(ty)

        self.ini.set_last_lowercase(str(self.lowercaseCb.GetValue()));
        
        classname = self.classNameCtrl.GetValue()
        self.ini.set_last_classname(classname)

        author = self.authorCtrl.GetValue()
        authors = self.ini.get_authors()
        while len(authors) >= 20:
            authors.pop()
        if author not in authors:
            authors.insert(0, author)
        self.ini.set_authors(authors)
        self.ini.set_last_author(author)

        email = self.emailCtrl.GetValue()
        emails = self.ini.get_emails()
        while len(emails) >= 20:
            emails.pop()
        if email not in emails:
            emails.insert(0, email)
        self.ini.set_emails(emails)
        self.ini.set_last_email(email)

        licIndex = self.licCtrl.GetCurrentSelection()
        self.ini.set_last_license(self.licCtrl.GetString(licIndex))

        self.ini.write(self.iniPath)


def App():
    app = wx.PySimpleApp()
    frame = MyFrame()
    frame.Center()
    frame.Show(True)
    app.MainLoop()


if __name__ == "__main__":
    App()
