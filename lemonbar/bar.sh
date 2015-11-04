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
		printf "%%{F#$blk}\u2022%%{F#$gre}  \u2022  \u2022  \u2022"
		;;
	2)
		printf "\u2022%%{F#$blk}  \u2022%%{F#$gre}  \u2022  \u2022"
		;;
	3)
		printf "\u2022  \u2022%%{F#$blk}  \u2022%%{F#$gre}  \u2022"
		;;
	4)
		printf "\u2022  \u2022  \u2022%%{F#$blk}  \u2022%%{F#$gre}"
		;;
	esac
}

clock() {
	date +"%a %H:%M"
}

battery() {
	sta="$(acpi | awk '{print $3}')"
	bat="$(acpi | awk '{print $4}')"

	if [ $sta = "Full," ]; then 
		bat=${bat::-1}
	else
		bat=${bat::-2}
	fi

	if [ $bat -lt 10 ]; then
		printf "%%{F#f96559}\uf244%%{F#$blk}"
	elif [ $bat -le 25 ]; then
		printf "\uf243"
	elif [ $bat -le 50 ]; then
		printf "\uf242"
	elif [ $bat -le 75 ]; then
		printf "\uf241"
	else
		printf "\uf240"
	fi
}

volume() {
	vol=$(amixer get Master | grep "Mono:" | cut -d ' ' -f 6 | sed -e "s/[^0-9]//g")
	sta=$(amixer get Master | grep "Mono:" | grep -o "\[off\]")
	
	if [[ -n $sta ]]; then
		printf "%%{F#$gre}"
	fi

	if [ $vol -le 10 ]; then
		printf "\uf026"
	elif [ $vol -le 50 ]; then
		printf "\uf027"
	else
		printf "\uf028"
	fi
	printf "%%{F#$blk}"
}

while true; do
	desktop="$(desktop)"
	clock="$(clock)"
	battery="$(battery)"
	volume="$(volume)"

	echo "%{B#00$bg}%{F#$gre}   $desktop   %{F#$blk}%{r}\
	%{A:bash sound & disown:}$volume   %{A}\
	%{A:bash $HOME/.lemonbar/popups/battery.sh & disown:}$battery   %{A}\
	$clock"
	
	sleep 0.15
done |

lemonbar -g 1872x32+0+0 -F \#FF$fg -B \#00$bg -f "System San Francisco Display:Regular:size=12" -f "FontAwesome:size=15" | bash

