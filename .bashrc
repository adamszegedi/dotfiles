#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.local/bin" ] ; then
	    PATH="$HOME/.local/bin:$PATH"
fi

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
		. startx
			logout
fi

# interactive shell not use .bash_profile so we need to check
# if this variable used by ssh-add is exported
if ! [[ -v SSH_AUTH_SOCK ]]
then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"  
fi

#import aliases
. ~/.aliases

#NVM startup for nodejs
source /usr/share/nvm/init-nvm.sh

PS1='[\u@\h \W]\$ '

#Export gpg tty
export GPG_TTY=$(tty)

#Run pfetch
pfetch

#Init Starship
eval "$(starship init bash)"
