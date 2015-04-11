#
# ~/.bash_profile
#

export EDITOR="emacs"
export GOPATH=~/src/go

[[ -f ~/.profile ]] && source ~/.profile
[[ -f ~/.bashrc ]] && source ~/.bashrc

add_to_path() {
  [[ -d "$1" ]] && export PATH="$PATH:$1"
}

add_to_path ~/bin
add_to_path /opt/android-sdk/platform-tools

if [[ -s ~/.rvm/scripts/rvm ]]; then
  source ~/.rvm/scripts/rvm
fi
