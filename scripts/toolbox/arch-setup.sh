#!/bin/bash
set -e -o pipefail

###
# enable podman socket inside toolbox
###
systemctl --user --now enable podman.socket

###
# update all installed packages to latest version
###
sudo pacman -Syu --noconfirm

###
# Install packages
###
sudo pacman -S --noconfirm neovim wl-clipboard

###
# Install neovim packages
###
sudo pacman -S --noconfirm fd jq lua51 luarocks ripgrep

# Install nodejs manager
if hash -t volta >&2; then
    echo Volta is available
else
    echo Volta is not available install it and export to PATH
    curl https://get.volta.sh | bash
    export PATH="$HOME/.volta/bin:$PATH"
    volta install node
fi

# Update neovim plugins
nvim --headless "+Lazy! restore" +qa

# Install rust
echo "Install rust"
if ! hash -t rustup >&2; then
    echo "Install rust dependency: gcc"
    sudo pacman -S --noconfirm gcc
    # install rust
    echo "Install rustup"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
fi
