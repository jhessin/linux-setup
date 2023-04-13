#!/usr/bin/env -S sudo bash
# shellcheck shell=bash

localectl set-x11-keymap us pc105 dvp compose:102,numpad:shift3,kpdl:semi,keypad:atm,caps:escape
localectl set-keymap --no-convert dvp
setxkbmap -layout us -variant dvp -option compose:102 -option keypad:atm -option numpad:shift3 -option kpdl:semi -option caps:escape

if ! grep -q Dvorak "/etc/default/console-setup"; then
{ 
	echo
	echo "# Set Programmer's Dvorak as the keyboard layout on startup"
	echo 'XKBLAYOUT="us"'
	echo 'XKBVARIANT="dvp"'
	echo 'XKBOPTIONS="compose:102,numpad:shift3,kpdl:semi,keypad:atm,caps:escape"'
} >> /etc/default/console-setup
fi
