#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#NVM startup for nodejs
source /usr/share/nvm/init-nvm.sh

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Export gpg tty
export GPG_TTY=$(tty)

#Init Starship
eval "$(starship init bash)"

#Run neofetch
neofetch

