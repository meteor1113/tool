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

set POSTFILE "~/bin/postfile" 
set CTRLX \028
set CTRLP \020
set postbuffer ""
set POSTCONTENT ""

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
		timeout 1800 {
			catch {open $POSTFILE r} fp
			set line [expr int(rand()*500)]
			for {set j 0} {$j<$line} {incr j} {
				if {[gets $fp postbuffer]==-1} {
					close $fp
					send "qqgg\n\n\n\n\n"
					sleep 5
					continue 
				}
			} 
			send "f\n"
			sleep 1
			for {set i 0} {$i<40} {incr i} {
				if {[gets $fp postbuffer]!=-1} {
					set POSTCONTENT $postbuffer 
				} else {
					close $fp
					send "qqgg\n\n\n\n\n"
					sleep 5
					continue
				}
				send "\n  "
				sleep 1
				send "$CTRLP"
				sleep 1
				send "$POSTCONTENT\n\n"
				sleep 1
				send "$POSTCONTENT"
				sleep 1
				send "$CTRLX"
				sleep 1
				send "f\n"
				sleep 1
				send "q"
			}
		close $fp
		send "qqgg\n\n\n\n\n"}
	}
	sleep 5
}

