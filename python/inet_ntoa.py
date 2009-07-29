#!/usr/bin/env python
#coding=utf-8

##
# Copyright (c) 2008 Meteor Liu <meteor1113@gmail.com>.
# All rights reserved.
#
# @file
# @author Meteor Liu
# @date 2008-10-27

"""inet_ntoa module"""

import socket
import struct

s = raw_input("input integer:")
n = int(s)
#ip = socket.inet_ntoa(struct.pack('I', socket.htonl(n)))
ip = socket.inet_ntoa(struct.pack('I', n))
print ip

raw_input("")
