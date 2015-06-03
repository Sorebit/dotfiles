#!/bin/bash
#
# Sorbet - (no copyrights whatsoever) 2015

# TODO:
# CPU usage ?
# WiFi 

white=f0f0f0
grey=2d2d2d
active=c3ac82

# This should go to xinitrc
xset fp+ /usr/share/fonts/myfonts/gohu
xset fp+ /usr/share/fonts/myfonts/icons
xset fp rehash

icon=-gohu-gohuicon-medium-r-normal--11-80-100-100-c-60-iso8859-1

icon() {
	echo "$(printf "\x$1")"
}

clock() {
	date +"%d %B, %H:%M"
}

desktop() {
	echo "$(/etc/lemonbar/workspace.sh)"
}

battery() {
	status="$(cat /sys/class/power_supply/BAT1/status | cut -c 1-3 )"
	left="$(cat /sys/class/power_supply/BAT1/capacity)"

	case "$status" in
		Ful)
			status="$(icon 87)"
			;;
		Cha)
			status="$(icon 88)"
			;;
		Dis)
			if [ $left -gt 90 ]; then
				status="$(icon 8d)"
			elif [ $left -gt 70 ]; then
				status="$(icon 8c)"
			elif [ $left -gt 40 ]; then
				status="$(icon 8b)"
			elif [ $left -gt 15 ]; then
				status="$(icon 8a)"
			else
				status="$(icon 89)"
			fi
			;;
	esac
	
	echo "$status  $left%%"
}

volume() {
	level="$(pactl list sinks | grep "Poziom " | cut -c 27-28)"
	mute="$(pactl list sinks | grep "Wyciszenie" | cut -c 14-16)"
	if [ $mute = yes ]; then
			icon="$(icon 98)"
	else
		if [ $level -gt 50 ]; then
			icon="$(icon 9b)"
		elif [ $level -gt 0 ]; then
			icon="$(icon 9a)"
		else
			icon="$(icon 99)"
		fi
	fi
	echo "$icon $level%%"
}

while true; do
	desktop="$(desktop)"
	clock="$(clock)"
	battery="$(battery)"
	volume="$(volume)"

	case "$desktop" in
		1) 
			echo "%{F#FF$white}%{B#FF$active}  $(icon 81)  www   %{B#FF$grey}  $(icon 85)  src   %{B#FF$grey}  $(icon 83)  irc   %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
		2) 
			echo "%{F#FF$white}%{B#FF$grey}  $(icon 81)  www   %{B#FF$active}  $(icon 85)  src   %{B#FF$grey}  $(icon 83)  irc   %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
		3)
			echo "%{F#FF$white}%{B#FF$grey}  $(icon 81)  www   %{B#FF$grey}  $(icon 85)  src   %{B#FF$active}  $(icon 83)  irc   %{B#FF$grey}%{c}   $clock   %{B#FF$active}%{r}   $volume   $battery   %{B#FF$grey}"
			;;
	esac
	
done |

lemonbar -g 1280x20+0+0 -B \#FF$grey -f $icon
