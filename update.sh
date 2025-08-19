#!/usr/bin/env bash

set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables

execute(){
    dt=$(date '+%H:%M:%S');
    echo ""
    padlength=90
    pad=$(printf '%0.1s' "-"{1..90}})
    string1="${1} - ${dt} "
    string2=' [Update] #'
    string3=' [Done]   #'
    printf '%s' "# ${string1}"
    printf '%*.*s' 0 $((padlength - ${#string1} - ${#string2} )) "$pad"
    printf '%s\n' "${string2}"
    printf "\n"
    eval "$2"
    printf "\n"
    printf '%s' "# ${string1}"
    printf '%*.*s' 0 $((padlength - ${#string1} - ${#string3} )) "$pad"
    printf '%s\n' "${string3}"
    printf "\n"
}

execute 'Pacman' 'sudo pacman -Syu'

execute 'Flatpak' 'flatpak update -y'

execute 'Rustup Toolchain update' 'rustup update'

execute 'Neovim - Config update' 'git -C ~/.config/nvim pull origin master'

execute 'Neovim - Lazy Update' 'nvim --headless "+Lazy! restore" +qa'
