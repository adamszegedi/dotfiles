let
    monitors = {
        main = "DP-3";
        side = "HDMI-A-1";
    };
    cursorSize = "36";
    cursorTheme = "Bibata-Modern-Ice";
in
{
    monitor = [
        "${monitors.main}, 2560x1440@60, 0x0, 1"
        "${monitors.side}, 2560x1440@60, -2560x0, 1"
    ];

    input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
    };

    exec = [
        "pkill -9 waybar; waybar;"
    ];

    exec-once = [
       "hypridle;"
       "hyprpaper;"
    ];

    env = [
        "HYPRCURSOR_SIZE,${cursorSize}"
        "HYPRCURSOR_THEME,${cursorTheme}-hypr"
        "XCURSOR_SIZE,${cursorSize}"
        "XCURSOR_THEME,${cursorTheme}"
    ];

    general = {
        gaps_in = 3;
        gaps_out = 5;
        "col.active_border" = "rgba(d0d0d0ff)";
        "col.inactive_border" = "rgba(1c1c1cff)";
    };

    decoration = {
        rounding = 10;
        drop_shadow = false;
        blur = {
            enabled = false;
        };
    };

    animations = {
        enabled = false;
    };

    dwindle = {
        pseudotile = true;
        preserve_split = true;
        no_gaps_when_only = true;
    };

    gestures = {
        workspace_swipe = false;
    };

    misc = {
        force_default_wallpaper = 0;
    };

    inherit (import ./keymaps.nix { monitors = monitors; }) bind bindm binde; 
    inherit (import ./window-rules.nix { monitors = monitors; }) windowrule windowrulev2 layerrule workspace; 
}
