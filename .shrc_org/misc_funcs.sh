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
    mkdir -p "$1" && cd "$1"
}


# "search processes for"
function s_ps_for {
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


function pycli {
    python3 -c "from sys import stdin; cli_in = stdin.read(); $1";
}


function gen_rand_nums {
    python3 -c "import random; print(''.join([str(x) for x in random.choices(range(0, 10), k=$1)]))"
}


function vdir {
    file="$(ls $1 | fzf)"
    [ -z "$file" ] || if [ -z "$1" ];then nvim "$file"; else nvim "$1/$file"; fi
}


function odir {
    file="$(ls $1 | fzf)"
    [ -z "$file" ] || if [ -z "$1" ];then open "$file"; else open "$1/$file"; fi
}


function rmex {
    find . ! -name "$1" -maxdepth 1 -exec rm -rf {} +
}


function findex {
    find . ! -name "$1"
}

