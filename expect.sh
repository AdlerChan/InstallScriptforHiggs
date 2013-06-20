#!/usr/bin/expect
spawn su root
expect "password:"
send "000000\r"
expect eof
#interact timeout 3 {send "\r"}
exit
