# If not running in a toolbox, don't do anything
[[ ! -f /run/.toolboxenv ]] && return

source /run/.containerenv

# aliases for container
alias podman="flatpak-spawn --host podman"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
