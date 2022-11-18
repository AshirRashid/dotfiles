#!/bin/sh

if [ $SHELL = /bin/zsh ]; then
    alias vrc="nvim ~/.zshrc"
    alias vtheme="nvim $ZSH/themes/$ZSH_THEME.zsh-theme"
    alias src="source ~/.zshrc"
    alias r="exec zsh -l"
else
    alias vrc="nvim ~/.bashrc"
    alias src="source ~/.bashrc"
    alias r="exec bash -l"
fi

alias vorg="nvim ~/.shrc_org"
alias vtmux="nvim ~/.tmux.conf"
alias tat="tmux attach -t"
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
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias python="python3"
alias pip="pip3"
alias ec="emacsclient"

