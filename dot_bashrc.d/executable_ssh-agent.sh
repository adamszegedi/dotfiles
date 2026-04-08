# shellcheck shell=bash
[[ -f /run/.toolboxenv ]] && return

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -S "${SSH_AUTH_SOCK:-}" ]]; then
    # shellcheck disable=SC1091
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
