#!/usr/bin/env python
#coding=utf-8
##
# @file
# @author Meteor Liu <meteor1113@gmail.com>
# @date 2008-09-16
#
# Copyright (C) 2008 Meteor Liu
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.

"""this program is create's Tk warpper version"""


# import standard library module
import sys
import os
import Tkinter
import tkMessageBox

# import other library module

# import customer module
import createcpp
import createc
import createpython
import createobjc
import createjava
import common
import tempcreateini


class TkCreateClass(object):
    """TkCreateClass class"""

    def __init__(self):
        """constructor"""
        self.iniPath = common.get_config_path()
        self.ini = tempcreateini.TempCreateIni(self.iniPath)
        self.create_ui()
        self.set_default_value()
        Tkinter.mainloop()

    def create_ui(self):
        top = Tkinter.Tk(className = " Create Class")

        Tkinter.Label(top, text = "Select Type").grid(row = 0, column = 0)
        self.typeRb1 = Tkinter.Radiobutton(top, text = "C++", value = 1)
        self.typeRb1.bind("<Button-1>", self.on_click_type1)
        self.typeRb2 = Tkinter.Radiobutton(top, text = "C", value = 2)
        self.typeRb2.bind("<Button-1>", self.on_click_type2)
        self.typeRb3 = Tkinter.Radiobutton(top, text = "Python", value = 3)
        self.typeRb3.bind("<Button-1>", self.on_click_type3)
        self.typeRb4 = Tkinter.Radiobutton(top, text = "Java", value = 4)
        self.typeRb4.bind("<Button-1>", self.on_click_type4)
        self.typeRb5 = Tkinter.Radiobutton(top, text = "ObjectiveC", value = 5)
        self.typeRb5.bind("<Button-1>", self.on_click_type5)
        self.typeRb1.grid(row = 1, column = 0)
        self.typeRb2.grid(row = 1, column = 1)
        self.typeRb3.grid(row = 1, column = 2)
        self.typeRb4.grid(row = 1, column = 4)
        self.typeRb5.grid(row = 1, column = 5)
        self.typeRb1.select()
        self.selectType = 1

        self.lowercase = Tkinter.IntVar()
        self.lowercaseCb = Tkinter.Checkbutton(top, variable = self.lowercase,
                                               text="lowercase filename?")
        self.lowercaseCb.grid(row = 2, column = 0)

        Tkinter.Label(top, text = "ClassName:").grid(row = 3, column = 0)
        self.classNameCtrl = Tkinter.Entry(top)
        self.classNameCtrl.grid(row = 3, column = 1, columnspan = 2,
                                sticky = Tkinter.W + Tkinter.E)

        Tkinter.Label(top, text = "Author:").grid(row = 4, column = 0)
        self.authorCtrl = Tkinter.Entry(top)
        self.authorCtrl.grid(row = 4, column = 1, columnspan = 2,
                             sticky = Tkinter.W + Tkinter.E)

        Tkinter.Label(top, text = "Email:").grid(row = 5, column = 0)
        self.emailCtrl = Tkinter.Entry(top)
        self.emailCtrl.grid(row = 5, column = 1, columnspan = 2,
                            sticky = Tkinter.W + Tkinter.E)

        Tkinter.Label(top, text = "Copyright:").grid(row = 6, column = 0)
        self.licScroll = Tkinter.Scrollbar(top, orient = Tkinter.VERTICAL)
        self.licCtrl = Tkinter.Listbox(top, height = 3,
                                       selectmode = Tkinter.SINGLE,
                                       yscrollcommand = self.licScroll.set)
        self.licCtrl.grid(row = 6, column = 1, columnspan = 2,
                          sticky = Tkinter.W + Tkinter.E)
        self.licCtrl.bind("<ButtonRelease-1>", self.on_select_license)
        self.licScroll.grid(row = 6, column = 3,
                            sticky = Tkinter.N + Tkinter.S)
        self.licScroll["command"] = self.licCtrl.yview

        self.crxs = Tkinter.Scrollbar(top, orient = Tkinter.HORIZONTAL)
        self.crys = Tkinter.Scrollbar(top, orient = Tkinter.VERTICAL)
        self.copyrightCtrl = Tkinter.Text(top,
                                          xscrollcommand = self.crxs.set,
                                          yscrollcommand = self.crys.set)
        self.copyrightCtrl.grid(row = 7, column = 1, columnspan = 2,
                                sticky = Tkinter.W + Tkinter.E)
        self.crxs.grid(row = 8, column = 1, columnspan = 2,
                       sticky = Tkinter.W + Tkinter.E)
        self.crxs["command"] = self.copyrightCtrl.xview
        self.crys.grid(row = 7, column = 3,
                       sticky = Tkinter.N + Tkinter.S)
        self.crys["command"] = self.copyrightCtrl.yview

        self.button = Tkinter.Button(top, height = 2, text = "Create")
        self.button.bind("<Button-1>", self.on_create)
        self.button.grid(row = 10, column = 1, columnspan = 3,
                         sticky = Tkinter.W + Tkinter.E)

    def set_default_value(self):
        lastType = self.ini.get_last_type()
        if lastType == "C++":
            self.on_click_type1(None)
            self.typeRb1.select()
        if lastType == "C":
            self.on_click_type2(None)
            self.typeRb2.select()
        if lastType == "Python":
            self.on_click_type3(None)
            self.typeRb3.select()
        if lastType == "Java":
            self.on_click_type4(None)
            self.typeRb4.select()
        if lastType == "ObjectiveC":
            self.on_click_type5(None)
            self.typeRb5.select()

        if (len(self.ini.get_last_lowercase()) > 0):
            lowercase = (self.ini.get_last_lowercase().lower() == "true")
            self.lowercase.set(1 if lowercase else 0)

        self.classNameCtrl.delete(0, Tkinter.END)
        self.classNameCtrl.insert(0, self.ini.get_last_classname())

        self.authorCtrl.delete(0, Tkinter.END)
        self.authorCtrl.insert(0, self.ini.get_last_author())

        self.emailCtrl.delete(0, Tkinter.END)
        self.emailCtrl.insert(0, self.ini.get_last_email())

        self.licCtrl.delete(0, Tkinter.END)
        licIndex = -1
        i = 0
        for lic in common.get_licenses():
            self.licCtrl.insert(Tkinter.END, lic)
            if lic == self.ini.get_last_license():
                licIndex = i
            i = i + 1
        self.licCtrl.selection_clear(0, Tkinter.END)
        self.licCtrl.see(licIndex)
        # in MacOS X, call selection_set() will cause Listbox's position error.
        if sys.platform != "darwin":
            self.licCtrl.selection_set(licIndex)
        self.select_license(self.ini.get_last_license())

    def select_license(self, lic):
        licPath = os.path.join(common.get_license_dir(), lic)
        if (os.path.isfile(licPath) and os.path.exists(licPath)):
            self.copyrightCtrl.delete(1.0, Tkinter.END)
            self.copyrightCtrl.insert(1.0, open(licPath).read())

    def on_select_license(self, event):
        lic = self.licCtrl.get(self.licCtrl.curselection()[0])
        self.select_license(lic)

    def on_click_type1(self, event):
        self.selectType = 1
        self.lowercase.set(1)

    def on_click_type2(self, event):
        self.selectType = 2
        self.lowercase.set(1)

    def on_click_type3(self, event):
        self.selectType = 3
        self.lowercase.set(1)

    def on_click_type4(self, event):
        self.selectType = 4
        self.lowercase.set(0)

    def on_click_type5(self, event):
        self.selectType = 5
        self.lowercase.set(0)

    def on_create(self, event):
        classname = self.classNameCtrl.get()
        if classname == "" or classname == None:
            tkMessageBox.showerror("", "classname can't be empty!")
            return
        author = self.authorCtrl.get()
        email = self.emailCtrl.get()
        cr = self.copyrightCtrl.get("1.0", Tkinter.END)
        lowercase = self.lowercase.get()
        if cr.endswith("\n"):
            cr = cr[: len(cr) - 1]
        if self.selectType == 1:
            createcpp.CreateFile(classname, author, email, cr, lowercase)
        if self.selectType == 2:
            createc.CreateFile(classname, author, email, cr, lowercase)
        if self.selectType == 3:
            createpython.CreateFile(classname, author, email, cr, lowercase)
        if self.selectType == 4:
            createjava.CreateFile(classname, author, email, cr, lowercase)
        if self.selectType == 5:
            createobjc.CreateFile(classname, author, email, cr, lowercase)

        self.save_ini()
        self.set_default_value()

    def save_ini(self):
        if self.selectType == 1:
            self.ini.set_last_type("C++")
        if self.selectType == 2:
            self.ini.set_last_type("C")
        if self.selectType == 3:
            self.ini.set_last_type("Python")
        if self.selectType == 4:
            self.ini.set_last_type("Java")
        if self.selectType == 5:
            self.ini.set_last_type("ObjectiveC")

        lowercase = "True" if self.lowercase.get() else "False"
        self.ini.set_last_lowercase(lowercase)

        classname = self.classNameCtrl.get()
        self.ini.set_last_classname(classname)

        author = self.authorCtrl.get()
        authors = self.ini.get_authors()
        while len(authors) >= 20:
            authors.pop()
        if author not in authors:
            authors.insert(0, author)
        self.ini.set_authors(authors)
        self.ini.set_last_author(author)

        email = self.emailCtrl.get()
        emails = self.ini.get_emails()
        while len(emails) >= 20:
            emails.pop()
        if email not in emails:
            emails.insert(0, email)
        self.ini.set_emails(emails)
        self.ini.set_last_email(email)

        licsel = self.licCtrl.curselection()
        if (licsel) :
            lic = self.licCtrl.get(licsel[0])
            self.ini.set_last_license(lic)

        self.ini.write(self.iniPath)


def App():
    TkCreateClass()


if __name__ == "__main__":
    App()
