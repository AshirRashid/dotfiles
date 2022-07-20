#!/bin/bash

PS1="\[\[\033[01;36m\]\W\[\033[00m\] "
[ $HOSTNAME != Ashirs-MBP ] && PS1="\[\033[01;37m\]\u\[\033[00m\] \[\033[01;36m\]\W\[\033[00m\] "

export BASH_SILENCE_DEPRECATION_WARNING=1
#set -o vi

# DOOM EMACS
export PATH="$HOME/.emacs.d/bin:$PATH"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashir/personal/gcp/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ashir/personal/gcp/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashir/personal/gcp/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ashir/personal/gcp/google-cloud-sdk/completion.bash.inc'; fi

# CUSTOM FILE
source /Users/ashir/.shrc_org/gtm_auto.sh
source /Users/ashir/.shrc_org/git_auto.sh
source /Users/ashir/.shrc_org/django_auto.sh
source /Users/ashir/.shrc_org/godot_auto.sh
source /Users/ashir/.shrc_org/nginx_auto.sh
source /Users/ashir/.shrc_org/misc_aliases.sh
source /Users/ashir/.shrc_org/misc_funcs.sh

# PLUGINS
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

