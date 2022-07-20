#!/bin/sh

if [ $SHELL = /bin/zsh ]; then
    alias vrc="vim ~/.zshrc"
    alias vtheme="vim $ZSH/themes/$ZSH_THEME.zsh-theme"
    alias src="source ~/.zshrc"
    alias r="exec zsh -l"
else
    alias vrc="vim ~/.bashrc"
    alias src="source ~/.bashrc"
    alias r="exec bash -l"
fi

alias vorg="vim ~/.shrc_org"
alias sed="sed -E"
alias emacs="emacsclient -c -a 'emacs'"
alias x="exit"
alias cl="clear"
alias stb="syncthing --browser-only"
alias sts="syncthing --no-browser >/dev/null 2>&1 &"
# "cptoday" stands for "copy today's date"
alias cptoday="date +'%d-%m-%Y' | pbcopy"
alias p="pbpaste"
alias mkx="chmod u+x"

