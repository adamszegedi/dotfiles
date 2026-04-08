# shellcheck shell=bash
[[ -f /run/.toolboxenv ]] && return

GPG_TTY=$(tty)
export GPG_TTY
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
