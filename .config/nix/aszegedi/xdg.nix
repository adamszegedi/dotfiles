{ pkgs, ... }:
{
    xdg.enable = true;
    xdg.userDirs.enable = true;
    xdg.desktopEntries = {
        nessy = {
            type = "Application";
            terminal = false;
            exec = "flatpak run com.github.iwalton3.jellyfin-media-player --scale-factor 2"; 
            name = "Nessy";
        };

        mc = {
            type = "Application";
            name = "Midnight Commander";
            genericName = "File Manager";
            comment = "Visual file manager";
            exec = "foot --title=mc -e mc";
            icon = "folder";
            terminal = false;
            categories = [ "Utility" ];
        };

        youtube = {
            type = "Application";
            exec = "flatpak run org.mozilla.firefox --new-window youtube.com";
            name = "Youtube";
            terminal = false;
        };
    };
}
