#!/usr/bin/env bash

set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o pipefail   # Unveils hidden failures
set -o nounset    # Exposes unset variables

restow() {
    if [[ ! -e "$@" ]]; then
        echo "############################################"
        printf "#            Not exists: %s                #" "$@"
        echo "############################################"
    fi
    stow -R -v "$@"
}

if [[ ! -h ~/.bashrc ]]; then
    # This can only happen on a brand new computer
    # so we remove these inital files to overwrite
    # with the stowed ones
    rm ~/.bashrc
    rm ~/.bash_profile
fi

echo ""
echo "Linking dotfiles through stow"
restow audio
restow bash
restow bat
restow bin
restow containers
restow ghostty
restow git
restow gnupg
restow 'local'
restow mpv
restow nvim 
restow sway
restow systemd
restow music-player

echo ""
echo "############################################"
echo "# Copying any files which cannot be linked #"
echo "############################################"

discord_location=~/.var/app/com.discordapp.Discord/config/
mkdir -p -v "${discord_location}" && cp -v ./discord/discord-flags.conf "${discord_location}"
brave_location=~/.var/app/com.brave.Browser/config/
mkdir -p -v "${brave_location}" && cp -v ./brave/brave-flags.conf "${brave_location}"

echo ""
echo "############################################"
echo "#         Install system packages          #"
echo "############################################"
sudo pacman -Syu --needed - < pkglist.txt

echo ""
echo "############################################"
echo "#          Install flatpak apps            #"
echo "############################################"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
xargs flatpak install -y < flatpaks.txt

echo ""
echo "############################################"
echo "#          Install brew apps            #"
echo "############################################"
brew -v bundle --file ./brew/.Brewfile
