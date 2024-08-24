{ monitors }:
let
    wallpaperPath = "/home/aszegedi/Pictures/wallpaper/norway_preikestolen.jpg";
in
{
    splash = false;
    preload = [ wallpaperPath ];

    wallpaper = [
        "${monitors.main},${wallpaperPath}"
        "${monitors.side},${wallpaperPath}"
    ]; 
}
