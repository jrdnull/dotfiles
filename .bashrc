#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set_titlebar() {
  printf "\033]0;%s\007" "$*"
}

# incase git prompt isn't available
__git_ps1() {
  true
}

if [[ -f ~/.dotfiles/git-prompt.sh ]]; then
  source ~/.dotfiles/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

title="$USER@$HOSTNAME:$PWD"
prompt="\[\e[0;32m\]\u@\h\[\e[0;34m\]:\w\[\e[0m\]"
PROMPT_COMMAND='__git_ps1 "$prompt" "% " " \[\e[0;33m\]on %s"; set_titlebar "$title"'

# universal aliases, put system specific ones in ~/.bash_aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ..='cd ..'
alias grep='grep --color=auto'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
