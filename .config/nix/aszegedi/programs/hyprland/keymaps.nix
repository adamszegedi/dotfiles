{ monitors }:
let
    super = "SUPER";
    workspaces = [1 2 3 4 5 6 7 8 9 ];
    binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
    commands = key: command: "${super}, ${key}, ${command}";
    shiftCommands = key: command: "${super} SHIFT, ${key}, ${command}";
    mBinding = binding super;
    mExec = key: program: binding super "exec" key program;
    mvFocus = binding super "movefocus";
    mvWindow = binding "${super} SHIFT" "movewindow";
    switchToWorkspace = binding super "workspace";
    moveToWorkspace = binding "${super} SHIFT" "movetoworkspace";
in
{
    bind = [
        (mExec "Return" "foot")
        (mExec "E" "hyprctl dispatch exec 'gtk-launch mc.desktop'")
        (mExec "D" "tofi-drun | xargs hyprctl dispatch exec --")
        (binding "${super} SHIFT" "exec" "D" "tofi-run | xargs hyprctl dispatch exec --")

        (commands "F" "fullscreen")
        (commands "V" "togglefloating")
        (commands "O" "togglesplit")
        (commands "P" "pseudo")
        
        (shiftCommands "Q" "killactive")
        (shiftCommands "M" "exit")

        (mvFocus "K" "u")
        (mvFocus "J" "d")
        (mvFocus "L" "r")
        (mvFocus "H" "l") 
        
        (mvWindow "K" "u")
        (mvWindow "J" "d")
        (mvWindow "L" "r")
        (mvWindow "H" "l") 

        (binding "${super} ALT" "movecurrentworkspacetomonitor" "0" monitors.main)
        (binding "${super} ALT" "movecurrentworkspacetomonitor" "1" monitors.side)
        
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioNext, exec, playerctl next"
        
        "ALT, Print, exec, grim -g \"$(slurp)\" -t png - | wl-copy -t image/png"
        "CONTROL, Print, exec, grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy -t image/png"
        ", Print, exec, grim - | wl-copy -t image/png"
    
    ]
    ++ (map (i: switchToWorkspace (toString i) (toString i)) workspaces)
    ++ (map (i: moveToWorkspace (toString i) (toString i)) workspaces);

    bindm = [
        "${super}, mouse:273, resizewindow"
        "${super}, mouse:272, movewindow"
    ];

    binde = [
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ];

}


