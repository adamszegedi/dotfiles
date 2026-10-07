# shellcheck shell=bash
[[ -f /run/.toolboxenv ]] && return

GPG_TTY=$(tty)
export GPG_TTY
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1

# Unlock the git signing key and cache its passphrase in gpg-agent
alias gpg-pass='echo unlock | gpg --local-user "$(git config --global user.signingkey)" --armor --sign > /dev/null'
