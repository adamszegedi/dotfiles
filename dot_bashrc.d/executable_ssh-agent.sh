# shellcheck shell=bash
[[ -f /run/.toolboxenv ]] && return

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
