#!/bin/bash
#
# OS X styled, lemonbar based
# Sorbet, https://github.com/Sorebit 

bg="#00e0e0e0"
gre="#9997ba"
blk="#373737"

xdesktop -s |
while read active; do
	echo -e "   %{F$gre}•  •  •  •  •" | sed s/•/%{F$blk}•%{F$gre}/$active
done |

lemonbar -g 140x32+0+0 -F $blk -B $bg -f "System San Francisco Display:size=15" | bash

