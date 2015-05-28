#!/bin/bash

# Execute
str=$(i3-msg -t get_workspaces)

index=$(echo "$str" | awk 'END { print index($0,"visible\":t") }')

echo ${str:$((index-5)):1}