#!/usr/bin/env python
#coding=utf-8

##
# Copyright (c) 2008 Meteor Liu <meteor1113@gmail.com>.
# All rights reserved.
#
# @file
# @author Meteor Liu
# @date 2008-10-27

"""getrawhttp module"""


import socket, sys

address = ""
path = ""

if len(sys.argv) < 2:
    address = raw_input("input address:")
else:
    address = sys.argv[1]

if len(sys.argv) < 3:
    path = raw_input("input path:")
else:
    path = sys.argv[2]

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((address, 80))
s.send("GET " + path + " HTTP/1.0\r\n\r\n")

while True:
    try:
        buf = s.recv(1024)
    except socket.error, err:
        break
    sys.stdout.write(buf)
s.close()

print
raw_input("")

