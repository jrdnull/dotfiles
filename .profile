export EDITOR="emacs"
export GOPATH=~/src/go

add_to_path() {
  [ -d "$1" ] && export PATH="$PATH:$1"
}

add_to_path ~/bin
add_to_path /opt/android-sdk/platform-tools
add_to_path /usr/local/go/bin
