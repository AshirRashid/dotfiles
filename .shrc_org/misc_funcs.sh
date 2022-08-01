#!/bin/bash

# Usage:
# c -n <text> to copy text without a trailing newline
# c <text> to copy text with a trailing newline
function c {
    if [ "$#" -eq 0 ]; then
        pbcopy
    else
        echo $1 $2 | pbcopy
    fi
}


function mcd {
    mkdir -p "$1"
    cd "$1"
}


# "search processes for"
function spf {
    ps -Af | sed -E "1p;/$1/!d" | grep -E -v "sed -E -E 1p;/$1/!d"
}

# stands for "store clipboard". Writes data to a file synced using syncthing
# $1: label
function storecb {
    printf "$1\t$(pbpaste)\n" >> /Users/ashir/Sync/Dump/store.md
}


function activate_venv {
    . "/Users/ashir/.virtualenv/$1/bin/activate"

}
