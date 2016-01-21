#!/bin/bash
#
# OS X styled, lemonbar based
# Sorbet, https://github.com/Sorebit 

bg="e0e0e0"
gre="707070"
blk="202020"

desktop() {
	current="$(wmctrl -d | grep -n -o "*" | cut -c 1)"
	
	case "$current" in
	1)
		printf "%%{F#$blk}\u2022%%{F#$gre}  \u2022  \u2022  \u2022  \u2022"
		;;
	2)
		printf "\u2022%%{F#$blk}  \u2022%%{F#$gre}  \u2022  \u2022  \u2022"
		;;
	3)
		printf "\u2022  \u2022%%{F#$blk}  \u2022%%{F#$gre}  \u2022  \u2022"
		;;
	4)
		printf "\u2022  \u2022  \u2022%%{F#$blk}  \u2022%%{F#$gre}  \u2022"
		;;
	5)
		printf "\u2022  \u2022  \u2022  \u2022%%{F#$blk}  \u2022%%{F#$gre}"
		;;
	esac
}

while true; do
	desktop="$(desktop)"

	echo "%{B#00$bg}%{F#$gre}   $desktop   %{F#$blk}"
	
	sleep 0.3
done |

lemonbar -g 140x32+0+0 -F \#$blk -B \#00$bg -f "System San Francisco Display:size=15" | bash
