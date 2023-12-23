#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Environment variables
GPG_TTY=$(tty)
export GPG_TTY
export MOZ_ENABLE_WAYLAND=1

#import aliases
. ~/.aliases

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi


# setup shell
eval "$(starship init bash)"

# fnm
export PATH="/home/aszegedi/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"
eval "$(fnm completions --shell bash)"
. "$HOME/.cargo/env"
