set -o vi

! command -v starship &> /dev/null && return
eval "$(starship init bash)"
