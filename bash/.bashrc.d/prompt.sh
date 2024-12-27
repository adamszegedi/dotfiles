set -o vi

[[ -f /run/.toolboxenv ]] && return

eval "$(starship init bash)"
