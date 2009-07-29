#!/usr/bin/env python
#coding=utf-8

##
# Copyright (c) 2008 Meteor Liu <meteor1113@gmail.com>.
# All rights reserved.
#
# @file
# @author Meteor Liu
# @date 2008-10-27

"""inet_addr module"""


import socket
import struct

s = raw_input("input integer:")
#ip = socket.inet_ntoa(struct.pack('I', socket.htonl(n)))
ip = struct.unpack('I', socket.inet_aton(s))
print ip

raw_input("")
