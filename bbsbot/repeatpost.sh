#!/usr/bin/expect

##
# @file
# @author Meteor Liu
# @date 2008-10-27
#
# Copyright (C) 2008 Meteor Liu <meteor1113@gmail.com>
#
# This code has been released into the Public Domain.
# You may do whatever you like with it.


set CTRLA \001
set CTRLC \037
set CTRLZ \032
set CTRLK \013
set CTRLO \017
set CTRLP \020
set CTRLX \030
set CTRLW \012

set sitename "bbs.dlut.edu.cn"
set username "meteors"
set password "lx120881"
set boardname "whisper"
set posttitle "surloverÄãºÃ"
set postcontent "hi"
set repeatnum 9

spawn telnet $sitename
expect "´úºÅ:"
send "$username\n"
expect "ÃÜÂë:"
send "$password\n\nq"
sleep 1
send "qqqqq"
send "qqqqq"
send "qqqqq"

send "b\n"
send "s"
send "$boardname\n"

for {set i 0} {$i < $repeatnum} {incr i} {
	send "$CTRLP"
	send "$posttitle\n\n"
	send "$postcontent"
	send "$CTRLX"
	send "\n"
}

interact {
	timeout 1 {send "eegg\n\n\n\n"}
}
send_user "\npost completed.\n"

