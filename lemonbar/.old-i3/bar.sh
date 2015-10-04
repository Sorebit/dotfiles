#!/bin/bash

bg1="535e66"
bg2="3b464c"
fg="dedfd5"

font=-gohu-gohufont-medium-r-normal--11-80-100-100-c-60-iso8859-1

desktop() {
	current="$(wmctrl -d | grep -n -o "*" | cut -c 1)"
	
	echo "- - - -" | sed s/-/*/$current
}

clock() {
	date +"%B %d, %H:%M"
}

music() {
	echo "Teebs - Piano Months"
}


while true; do
	desktop="$(desktop)"
	clock="$(clock)"
	music="$(music)"

	echo "%{l}   $desktop   %{c}   $clock   %{r}%{B#$bg2}   $music  %{B#$bg1}"
done |

lemonbar -g 1280x24+0+0 -F \#FF$fg -B \#FF$bg1 -f $font
