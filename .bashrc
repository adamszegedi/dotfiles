#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland 
fi

set -o vi
export EDITOR=/usr/bin/nvim

#Environment variables
GPG_TTY=$(tty)
export GPG_TTY
export MOZ_ENABLE_WAYLAND=1

#import aliases
. ~/.aliases

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# setup shell
eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
