#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#Environment variables
GPG_TTY=$(tty)
export GPG_TTY
export MOZ_ENABLE_WAYLAND=1

#import aliases
. ~/.aliases

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(fnm env --use-on-cd)"
eval "$(starship init bash)"
. "$HOME/.cargo/env"
