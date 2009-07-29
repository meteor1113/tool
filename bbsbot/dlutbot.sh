#!/usr/local/bin/expect

##
# @file
# @author Meteor Liu
# @date 2008-10-27
#
# Copyright (C) 2008 Meteor Liu <meteor1113@gmail.com>
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.


exp_version -exit 5.0
set timeout 6 
if {$argc<2} {
	send_user "usage: $argv0 username password\n"
	exit 1
}

set username [lindex $argv 0] 
set password [lindex $argv 1]

for {} {1} {} {
spawn telnet bbs.dlut.edu.cn
expect "login:"
send "bbs\n"
expect "):"
send "$username\n"
expect ":"
send "$password\n\nqqqqqq"
interact {
timeout 1800 {send "gg\n\n\n\n\n"}
}
sleep 5
}

