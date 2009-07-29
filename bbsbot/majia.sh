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


set MAJIAFILE "~/bin/majia"  
  
if [catch {open $MAJIAFILE} fp] exit 
set line 0 
while {1} { 
	if {[gets $fp postbuffer]!=-1} {
		set username $postbuffer 
		incr line 
	} else {
		exit
	}
	if {[gets $fp postbuffer]!=-1} {
		set password $postbuffer 
		incr line 
	} else {
		exit
	}

	spawn telnet bbs.dlut.edu.cn
	expect "login:"
	send "bbs\n"
	expect "):"
	send "$username\n"
	expect ":"
	send "$password\n\nqqqqqq"
	interact {
	timeout 1 {send "gg\n\n\n\n\n"}
	}
	sleep 1
} 

