#!/bin/sh

. shadow-common

# show logo
echo
curtty="$(tty | grep tty)"
logo="$SHADOW_CONFIG_DIR/logo"
if [ -z "$curtty" ]; then
	# terminal
	img2sixel -B "#212121" "$logo"
else
	# tty
	catimg -t -c -H 48 "$logo"
fi
echo

# setup $PS1
PS1='\033[1;33m \w'
if [ "$(id -u)" = "0" ]; then
	PS1="$PS1 # "
else
	PS1="$PS1 $ "
fi
export PS1="$PS1\033[0;37m"

# start window manager on tty1
if [ "$curtty" = "/dev/tty1" ]; then
	river
fi
