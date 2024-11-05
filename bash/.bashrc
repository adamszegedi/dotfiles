#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Environment variables
GPG_TTY=$(tty)
export GPG_TTY
export MOZ_ENABLE_WAYLAND=1

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec sway
fi

set -o vi
export EDITOR=/usr/bin/nvim

#import aliases
. ~/.aliases

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
	PATH="$HOME/.cargo/bin:$PATH"
fi

# nvm init
source /usr/share/nvm/init-nvm.sh
