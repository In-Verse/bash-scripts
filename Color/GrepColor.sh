#!/bin/bash

# Select Graphic Rendition (SGR) commands, ex. '\33['...'m')
# ECMA-48, 8.3.117 SGR - Select Graphic Rendition lists control sequences for 8 foreground, 8 background colors
# 1 (bold), 4(underline), 5(blink), 7(inverse), 39 for default foreground color, 30-37 for foreground colors
# 90-97 for 16 color mode foreground colors
# 38;4;0 to 38;5;255 for 88-color and 256 color modes background colors

# 30-37 foreground, 40-47 for background
# Black on white: ESC[30;47m , Red: ESC[31m;1m , Reset to Defaults ESC[39;49m , Reset all attributes: ESC[0m

# Printf with ANSI codes

# Change ur prompt
# PS1='\e[1;34m\u@\h:\e[0;34m\w\e[0m\$ /'


# GREP_COLORS is a value that is a colon-separated list of terminfo capabilities

export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

# Alternate "highlighting"
#GREP_COLOR="5;31" egrep -i '(ff ff|ca fe)'

# Sample Colors
# 01;31 is bold red
# 01;35 is bold magenta
# 01;36 is bold cyan
# 01;32 is bold gree

function GrepColor {
	cat '/dev/urandom' | hexdump | grep --color "ff ff"
}

GrepColor
