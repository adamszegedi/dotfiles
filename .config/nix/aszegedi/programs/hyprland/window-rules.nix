{ monitors }:
{
    layerrule = [
        "noanim, launcher"
    ];

    windowrulev2 = [
        "suppressevent maximize, class:.*" 
        "workspace 5,title:^(Microsoft Teams.*)$"
        "workspace 7,title:^(gamescope)$"
        "workspace 4,title:^(mc)$"
        "workspace 7,class:^(gamescope)$"
        "workspace 5,title:^(Discord.*)$"
        "float,class:^(org.mozilla.firefox)$,title:^(Picture-in-Picture)$"
        "pin,class:^(org.mozilla.firefox)$,title:^(Picture-in-Picture)$"
        "size 50% 50%,class:^(org.mozilla.firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(Steam)$,title:^(.*News.*)$"
    ];

    windowrule = [
        "float,title:^(Open)$"
        "float,title:^(Choose Files)$"
        "float,title:^(Save As)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "center,pavucontrol"
        "float,pavucontrol"
        "workspace 7,explorer.exe"
        "workspace 7,battle.net.exe"
        "workspace 7 silent,steam"
        "workspace 9,org.remmina.Remmina"
    ];

    workspace = [
        "1,monitor:${monitors.main}"
        "2,monitor:${monitors.main}"
        "3,monitor:${monitors.main}"
        "4,monitor:${monitors.main}"
        "5,monitor:${monitors.side}"
        "6,monitor:${monitors.side}"
        "7,monitor:${monitors.main}"
        "8,monitor:${monitors.side}"
        "9,monitor:${monitors.main}"
    ];
}

