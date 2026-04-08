# shellcheck shell=bash
! [[ -d /home/linuxbrew ]] && return

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

HOMEBREW_PREFIX="$(brew --prefix)"
if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
then
    # shellcheck disable=SC1091
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
        # shellcheck disable=SC1090
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
fi

