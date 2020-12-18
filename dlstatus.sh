#!/bin/bash

# APCSP Ux.03b Project - Bash Alive

# Checks to see if alive or dead, supresses output, and then echos alive or dead
function pingchecker ()
{
        if ping $1 -c 1 -w 1 >/dev/null 2> /dev/null; then
                echo -e "${1:0:4} : \e[1;36malive\e[0m"
        else
                echo -e "${1:0:4} : \e[1;31mdead\e[0m"
        fi
}

# Checks command line, if so puts into pingchecker function
for name in "$@"; do
pingchecker $name.mpwteach.com
done

# Checks if there was values inputted, if so exit

if [ $# -gt 1 ]; then
exit
fi

# Pings all droplets from 01 to 11
for i in {01..11}; do
pingchecker dl$i.mpwteach.com
done

