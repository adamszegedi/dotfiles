echo ""
echo "############################################"
echo "#          Install flatpak apps            #"
echo "############################################"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
while IFS= read -r app && [ -n "$app" ]; do
    flatpak install -y "$app"
done < ~/.dotfiles/deploy/flatpaks.txt
