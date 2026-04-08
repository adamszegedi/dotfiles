# shellcheck shell=bash
! [[ -f ~/.cargo/env ]] && return

# shellcheck disable=SC1091
. "$HOME/.cargo/env"
