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

# fnm
export PATH="/home/aszegedi/.local/share/fnm:$PATH"
eval "`fnm env`"


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# setup shell
eval "$(starship init bash)"
# PS1='󰣇 \u@\h  \W [$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)] $?\n> '
