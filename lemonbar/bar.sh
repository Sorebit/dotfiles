#!/bin/bash

# TODO:
# CPU usage ?
# WiFi 
# Volume

white=f0f0f0
grey=2d2d2d
#grey=000c17
#active=d7c96b
active=c3ac82

font=-gohu-gohufont-medium-r-normal--11-80-100-100-c-60-iso8859-1

desktop() {
	current="$(/etc/lemonbar/workspace.sh)"
	echo "$current"
}

clock() {
	date +"%d %B, %H:%M"
}

battery() {
	batcol=$white
	status="$(cat /sys/class/power_supply/BAT1/status | cut -c 1-3 )"
	#case "$status" in
	# 	Full)
	# 		status=""
	# 		;;
	# 	Charging)
	# 		status=""
	# 		;;
	# 	Discharging)
	# 		status=""
	# 		;;
	#
	left="$(cat /sys/class/power_supply/BAT1/capacity)"
	echo "%{F#FF$batcol}$status $left%%"
}

volume() {
	level="$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)"
	echo "Vol $level%%"
}

while true; do
	desktop="$(desktop)"
	clock="$(clock)"
	battery="$(battery)"
	volume="$(volume)"
	case "$desktop" in
		1) 
			echo "%{F#FF$white}%{B#FF$active}  W   www    %{B#FF$grey}  S   src   %{B#FF$grey}  I   irc    %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
		2) 
			echo "%{F#FF$white}%{B#FF$grey}  W   www    %{B#FF$active}  S   src   %{B#FF$grey}  I   irc    %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
		3)
			echo "%{F#FF$white}%{B#FF$grey}  W   www    %{B#FF$grey}  S   src   %{B#FF$active}  I   irc    %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
	esac
	sleep 0.15
done |

lemonbar -g 1280x20+0+0 -f $font -d -B \#FF$grey | bash