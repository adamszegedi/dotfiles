# shellcheck shell=bash
# If not running in a toolbox, don't do anything
[[ ! -f /run/.toolboxenv ]] && return

# shellcheck disable=SC1091
source /run/.containerenv

# aliases for container
alias podman="flatpak-spawn --host podman"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
