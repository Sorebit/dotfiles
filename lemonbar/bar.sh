#!/bin/bash
#
# Sorbet - (no copyrights whatsoever) 2015

# TODO: internet connection notification, daemon, whatever will do

white=f0f0f0
grey=2d2d2d
active=c3ac82
notif=0

# This should go to some init file
xset fp+ /usr/share/fonts/myfonts/gohu
xset fp+ /usr/share/fonts/myfonts/icons
xset fp rehash

font=-gohu-gohuicon-medium-r-normal--11-80-100-100-c-60-iso8859-1

icon() {
	# Print special characters
	echo "$(printf "\x$1")"
}

clock() {
	# Get the current date and time
	date +"%d %B, %H:%M"
}

desktop() {
	# Get the active desktop
	echo "$(/etc/lemonbar/workspace.sh)"
}

volume() {
	# Get the current volume and speaker status
	level="$(pactl list sinks | grep "Poziom " | cut -c 27-28)"
	mute="$(pactl list sinks | grep "Wyciszenie" | cut -c 14-16)"
	if [ $mute = yes ]; then
			icon="$(icon 98)"
	elif [ $level -gt 50 ]; then
		icon="$(icon 9b)"
	elif [ $level -gt 0 ]; then
		icon="$(icon 9a)"
	else
		icon="$(icon 99)"
	fi
	echo "$icon $level%%"
}

cpu() {
	# Wrong output?
	percent="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')"
	rounded="$(echo $percent | cut -d. -f1)"
	if [ $rounded -lt 10 ]; then
		rounded="0$rounded"
	fi
	echo "$(icon 82) $rounded%%"
}


while true; do
	# Battery state, not in a function, because of notification flag 
	status="$(cat /sys/class/power_supply/BAT1/status | cut -c 1-3 )"
	left="$(cat /sys/class/power_supply/BAT1/capacity)"
	case "$status" in
		Ful)
			notif=0
			ico="$(icon 87)"
			;;
		Cha)
			notif=0
			ico="$(icon 88)"
			;;
		Dis)
			if [ $left -gt 90 ]; then
				ico="$(icon 8d)"
			elif [ $left -gt 70 ]; then
				ico="$(icon 8c)"
			elif [ $left -gt 40 ]; then
				status="$(icon 8b)"
			elif [ $left -gt 15 ]; then
				ico="$(icon 8a)"
			else
				ico="$(icon 89)"
				if [ $notif -eq 0 ]; then
					notify-send -u critical "Battery" "Less than 15% left"
					notif=1
				fi
			fi
			;;
	esac
	if [ $left -lt 10 ]; then
		left="0$left"
	fi
	battery="$ico $left%%"
	
	desktop="$(desktop)"
	clock="$(clock)"
	volume="$(volume)"
	cpu="$(cpu)"

	case "$desktop" in
		1) 
			buf="%{F#FF$white}%{B#FF$active}  $(icon 81)  www   %{B#FF$grey}  $(icon 85)  src   %{B#FF$grey}  $(icon 83)  irc   %{B#FF$grey}"
			;;
		2) 
			buf="%{F#FF$white}%{B#FF$grey}  $(icon 81)  www   %{B#FF$active}  $(icon 85)  src   %{B#FF$grey}  $(icon 83)  irc   %{B#FF$grey}"
			;;
		3)
			buf="%{F#FF$white}%{B#FF$grey}  $(icon 81)  www   %{B#FF$grey}  $(icon 85)  src   %{B#FF$active}  $(icon 83)  irc   %{B#FF$grey}"
			;;
	esac
	buf="$buf%{c}   $clock   %{B#FF$active}%{r}   $volume   $cpu   $battery   %{B#FF$grey}"
	echo -e "$buf"
	sleep 0.15
done |

lemonbar -g 1280x20+0+0 -B \#FF$grey -f $font