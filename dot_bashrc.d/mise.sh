! command -v mise &> /dev/null && return

echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
