command -v port &>/dev/null || return
[[ ":$PATH:" == *":/opt/local/bin:"* ]] && return

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
