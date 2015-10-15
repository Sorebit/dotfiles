#!/bin/bash

# Kill popup if exists
path=""

if [ -n $path ]; do
	pkill -f "feh --title music_art"
fi

feh --title music_art --zoom fill -g 120x120+1136+656 ~/pictures/cover.png & disown
