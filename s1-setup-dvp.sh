#!/usr/bin/env -S sudo bash

if ! grep -q Dvorak "/etc/default/console-setup"; then
{ 
	echo
	echo "# Set Programmer's Dvorak as the keyboard layout on startup"
	echo 'XKBLAYOUT="us"'
	echo 'XKBVARIANT="dvp"'
	echo 'XKBOPTIONS="compose:102,numpad:shift3,kpdl:semi,keypad:atm,caps:escape"'
} >> /etc/default/console-setup
fi
